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

# Connection pool
pool = psycopg.ConnectionPool(
    conninfo=" ".join(f"{k}={v}" for k, v in DB_CONFIG.items()),
    min_size=1,
    max_size=10
)

@contextmanager
def get_db_connection():
    """Context manager for database connections"""
    conn = pool.getconn()
    try:
        # Use dict_row to get results as dictionaries
        conn.row_factory = dict_row
        yield conn
    finally:
        pool.putconn(conn)

@contextmanager
def get_db_cursor():
    """Context manager for database cursors"""
    with get_db_connection() as conn:
        with conn.cursor() as cur:
            yield cur
            conn.commit()

# Database initialization
def init_db():
    """Initialize the database with required tables"""
    with get_db_cursor() as cur:
        cur.execute("""
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                username VARCHAR(80) UNIQUE NOT NULL,
                email VARCHAR(120) UNIQUE NOT NULL,
                password_hash VARCHAR(128) NOT NULL
            )
        """)
        
        cur.execute("""
            CREATE TABLE IF NOT EXISTS songs (
                id SERIAL PRIMARY KEY,
                title VARCHAR(100) NOT NULL,
                artist VARCHAR(100) NOT NULL,
                album VARCHAR(100),
                file_path VARCHAR(200) NOT NULL,
                duration INTEGER
            )
        """)
        
        cur.execute("""
            CREATE TABLE IF NOT EXISTS playlists (
                id SERIAL PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
            )
        """)
        
        cur.execute("""
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
        with get_db_cursor() as cur:
            cur.execute("""
                INSERT INTO users (username, email, password_hash)
                VALUES (%s, %s, %s)
                RETURNING id
            """, (username, email, password_hash))
            return cur.fetchone()['id']

    @staticmethod
    def get_user_by_id(user_id):
        with get_db_cursor() as cur:
            cur.execute("SELECT * FROM users WHERE id = %s", (user_id,))
            return cur.fetchone()

    @staticmethod
    def get_user_by_username(username):
        with get_db_cursor() as cur:
            cur.execute("SELECT * FROM users WHERE username = %s", (username,))
            return cur.fetchone()

# Song related database operations
class SongDB:
    @staticmethod
    def get_all_songs():
        with get_db_cursor() as cur:
            cur.execute("SELECT * FROM songs ORDER BY title")
            return cur.fetchall()

    @staticmethod
    def add_song(title, artist, album, file_path, duration):
        with get_db_cursor() as cur:
            cur.execute("""
                INSERT INTO songs (title, artist, album, file_path, duration)
                VALUES (%s, %s, %s, %s, %s)
                RETURNING id
            """, (title, artist, album, file_path, duration))
            return cur.fetchone()['id']

# Playlist related database operations
class PlaylistDB:
    @staticmethod
    def create_playlist(name, user_id):
        with get_db_cursor() as cur:
            cur.execute("""
                INSERT INTO playlists (name, user_id)
                VALUES (%s, %s)
                RETURNING id
            """, (name, user_id))
            return cur.fetchone()['id']

    @staticmethod
    def get_user_playlists(user_id):
        with get_db_cursor() as cur:
            cur.execute("""
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
            return cur.fetchall()

    @staticmethod
    def add_song_to_playlist(playlist_id, song_id):
        with get_db_cursor() as cur:
            cur.execute("""
                INSERT INTO playlist_songs (playlist_id, song_id)
                VALUES (%s, %s)
            """, (playlist_id, song_id)) 