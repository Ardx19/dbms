import os
from contextlib import contextmanager
import psycopg
from psycopg.rows import dict_row
from dotenv import load_dotenv

load_dotenv()

# Database connection parameters
DB_CONFIG = {
    "dbname": "music_stream",
    "user": "postgres",
    "password": os.getenv("DB_PASSWORD", "password"),
    "host": "localhost",
    "port": "5432"
}

# Create connection string
conn_string = " ".join(f"{k}={v}" for k, v in DB_CONFIG.items())

@contextmanager
def get_db():
    """Context manager for database connections"""
    # Using the connection as a context manager automatically handles commit/rollback
    with psycopg.connect(conn_string) as conn:
        # Use dictionary cursor by default
        conn.row_factory = dict_row
        yield conn

def execute_query(query, params=None):
    """Execute a query and return the results"""
    with get_db() as conn:
        # Connection.execute() is a shortcut in psycopg3
        return conn.execute(query, params).fetchall()

def execute_single(query, params=None):
    """Execute a query and return a single result"""
    with get_db() as conn:
        # Chain execute and fetchone as per psycopg3 shortcuts
        return conn.execute(query, params).fetchone()

# Database initialization
def init_db():
    """Initialize the database with required tables"""
    with get_db() as conn:
        # Execute can be called directly on the connection in psycopg3
        conn.execute("""
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                username VARCHAR(80) UNIQUE NOT NULL,
                email VARCHAR(120) UNIQUE NOT NULL,
                password_hash VARCHAR(128) NOT NULL
            )
        """)
        
        conn.execute("""
            CREATE TABLE IF NOT EXISTS songs (
                id SERIAL PRIMARY KEY,
                title VARCHAR(100) NOT NULL,
                artist VARCHAR(100) NOT NULL,
                album VARCHAR(100),
                file_path VARCHAR(200) NOT NULL,
                duration INTEGER
            )
        """)
        
        conn.execute("""
            CREATE TABLE IF NOT EXISTS playlists (
                id SERIAL PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
            )
        """)
        
        conn.execute("""
            CREATE TABLE IF NOT EXISTS playlist_songs (
                playlist_id INTEGER REFERENCES playlists(id) ON DELETE CASCADE,
                song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE,
                PRIMARY KEY (playlist_id, song_id)
            )
        """)

# User related database operations
class UserDB:
    @staticmethod
    def create_user(username, email, password_hash):
        return execute_single("""
            INSERT INTO users (username, email, password_hash)
            VALUES (%s, %s, %s)
            RETURNING id
        """, (username, email, password_hash))['id']

    @staticmethod
    def get_user_by_id(user_id):
        return execute_single(
            "SELECT * FROM users WHERE id = %s",
            (user_id,)
        )

    @staticmethod
    def get_user_by_username(username):
        return execute_single(
            "SELECT * FROM users WHERE username = %s",
            (username,)
        )

# Song related database operations
class SongDB:
    @staticmethod
    def get_all_songs():
        return execute_query("SELECT * FROM songs ORDER BY title")

    @staticmethod
    def add_song(title, artist, album, file_path, duration):
        return execute_single("""
            INSERT INTO songs (title, artist, album, file_path, duration)
            VALUES (%s, %s, %s, %s, %s)
            RETURNING id
        """, (title, artist, album, file_path, duration))['id']

# Playlist related database operations
class PlaylistDB:
    @staticmethod
    def create_playlist(name, user_id):
        return execute_single("""
            INSERT INTO playlists (name, user_id)
            VALUES (%s, %s)
            RETURNING id
        """, (name, user_id))['id']

    @staticmethod
    def get_user_playlists(user_id):
        return execute_query("""
            SELECT p.*, array_agg(json_build_object(
                'id', s.id,
                'title', s.title,
                'artist', s.artist,
                'file_path', s.file_path
            )) as songs
            FROM playlists p
            LEFT JOIN playlist_songs ps ON p.id = ps.playlist_id
            LEFT JOIN songs s ON ps.song_id = s.id
            WHERE p.user_id = %s
            GROUP BY p.id
        """, (user_id,))

    @staticmethod
    def add_song_to_playlist(playlist_id, song_id):
        with get_db() as conn:
            conn.execute("""
                INSERT INTO playlist_songs (playlist_id, song_id)
                VALUES (%s, %s)
            """, (playlist_id, song_id)) 
