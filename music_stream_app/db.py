import os
from contextlib import contextmanager
import psycopg
from psycopg.rows import dict_row
from dotenv import load_dotenv

load_dotenv()

# Database connection parameters
DB_CONFIG = {
    "dbname": "project",
    "user": "postgres",
    "password": os.getenv("DB_PASSWORD", "root"),
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

# User related database operations
class UserDB:
    @staticmethod
    def create_user(user_name, email, password_hash, pfp_url=None, premium=False):
        return execute_single("""
            INSERT INTO Users (user_name, email, password_hash, pfp_url, premium)
            VALUES (%s, %s, %s, %s, %s)
            RETURNING user_id
        """, (user_name, email, password_hash, pfp_url, premium))['user_id']

    @staticmethod
    def get_user_by_id(user_id):
        return execute_single(
            "SELECT * FROM Users WHERE user_id = %s",
            (user_id,)
        )

    @staticmethod
    def get_user_by_username(user_name):
        return execute_single(
            "SELECT * FROM Users WHERE user_name = %s",
            (user_name,)
        )
        
    @staticmethod
    def update_user_premium_status(user_id, premium):
        with get_db() as conn:
            conn.execute("""
                UPDATE Users 
                SET premium = %s 
                WHERE user_id = %s
            """, (premium, user_id))
            
    @staticmethod
    def update_user_offline_songs(user_id, offline_songs):
        with get_db() as conn:
            conn.execute("""
                UPDATE Users 
                SET offline_songs = %s 
                WHERE user_id = %s
            """, (offline_songs, user_id))

# Song related database operations
class SongDB:
    @staticmethod
    def get_all_songs():
        return execute_query("""
            SELECT s.*, a.album_name, ar.artist_name, rl.record_label_name
            FROM Songs s
            LEFT JOIN Albums a ON s.album_id = a.album_id
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            LEFT JOIN Artists ar ON sa.artist_id = ar.artist_id
            LEFT JOIN RecordLabels rl ON ar.record_label_id = rl.record_label_id
            ORDER BY s.title
        """)
    
    @staticmethod
    def get_all_genres():
        """Fetches all distinct genres."""
        query = "SELECT DISTINCT genre FROM Songs WHERE genre IS NOT NULL ORDER BY genre"
        results = execute_query(query, fetch_all=True)
        return [row['genre'] for row in results] if results else []

    @staticmethod
    def add_song(title, duration, language, album_id, music_video_url, genre, file_url, release_date, artist_ids):
        with get_db() as conn:
            # Insert song
            song_id = conn.execute("""
                INSERT INTO Songs (title, duration, language, album_id, music_video_url, genre, file_url, release_date)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                RETURNING song_id
            """, (title, duration, language, album_id, music_video_url, genre, file_url, release_date)).fetchone()['song_id']
            
            # Add artist associations
            for artist_id in artist_ids:
                conn.execute("""
                    INSERT INTO Song_Artists (song_id, artist_id)
                    VALUES (%s, %s)
                """, (song_id, artist_id))
            
            return song_id

    @staticmethod
    def increment_stream_count(song_id):
        with get_db() as conn:
            conn.execute("""
                UPDATE Songs 
                SET stream_count = stream_count + 1 
                WHERE song_id = %s
            """, (song_id,))

    @staticmethod
    def get_songs_by_album(album_id):
        return execute_query("""
            SELECT 
                s.song_id,
                s.title,
                s.language,
                s.album_id,
                s.music_video_url,
                s.genre,
                s.file_url,
                s.release_date,
                s.stream_count,
                (SPLIT_PART(s.duration, ':', 1)::integer * 60 + SPLIT_PART(s.duration, ':', 2)::integer) as duration,
                ar.artist_name
            FROM Songs s
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            LEFT JOIN Artists ar ON sa.artist_id = ar.artist_id
            WHERE s.album_id = %s
            ORDER BY s.title
        """, (album_id,))

    @staticmethod
    def get_songs_by_artist(artist_id):
        return execute_query("""
            SELECT s.*, a.album_name
            FROM Songs s
            LEFT JOIN Albums a ON s.album_id = a.album_id
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            WHERE sa.artist_id = %s
            ORDER BY s.title
        """, (artist_id,))

    @staticmethod
    def get_songs_by_genre(genre):
        return execute_query("""
            SELECT s.*, a.album_name, ar.artist_name
            FROM Songs s
            LEFT JOIN Albums a ON s.album_id = a.album_id
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            LEFT JOIN Artists ar ON sa.artist_id = ar.artist_id
            WHERE s.genre = %s
            ORDER BY s.title
        """, (genre,))

# Album related database operations
class AlbumDB:
    @staticmethod
    def create_album(album_name, release_date, cover_url, artist_id, record_label_id, album_type):
        return execute_single("""
            INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
            VALUES (%s, %s, %s, %s, %s, %s)
            RETURNING album_id
        """, (album_name, release_date, cover_url, artist_id, record_label_id, album_type))['album_id']

    @staticmethod
    def update_album(album_id, album_name=None, release_date=None, cover_url=None, artist_id=None, record_label_id=None, album_type=None):
        updates = []
        params = []
        
        if album_name is not None:
            updates.append("album_name = %s")
            params.append(album_name)
        if release_date is not None:
            updates.append("release_date = %s")
            params.append(release_date)
        if cover_url is not None:
            updates.append("cover_url = %s")
            params.append(cover_url)
        if artist_id is not None:
            updates.append("artist_id = %s")
            params.append(artist_id)
        if record_label_id is not None:
            updates.append("record_label_id = %s")
            params.append(record_label_id)
        if album_type is not None:
            updates.append("album_type = %s")
            params.append(album_type)
            
        if not updates:
            return
            
        query = f"""
            UPDATE Albums 
            SET {', '.join(updates)}
            WHERE album_id = %s
        """
        params.append(album_id)
        
        with get_db() as conn:
            conn.execute(query, params)

    @staticmethod
    def get_album_by_id(album_id):
        return execute_single("""
            SELECT a.*, ar.artist_name, rl.record_label_name
            FROM Albums a
            LEFT JOIN Artists ar ON a.artist_id = ar.artist_id
            LEFT JOIN RecordLabels rl ON a.record_label_id = rl.record_label_id
            WHERE a.album_id = %s
        """, (album_id,))

    @staticmethod
    def get_albums_by_artist(artist_id):
        return execute_query("""
            SELECT 
                a.*, 
                rl.record_label_name,
                COUNT(DISTINCT s.song_id) as song_count,
                COALESCE(SUM(s.stream_count), 0) as total_streams
            FROM Albums a
            LEFT JOIN RecordLabels rl ON a.record_label_id = rl.record_label_id
            LEFT JOIN Songs s ON a.album_id = s.album_id
            WHERE a.artist_id = %s
            GROUP BY a.album_id, rl.record_label_name
            ORDER BY a.release_date DESC
        """, (artist_id,))
    
    
    @staticmethod
    def get_all_albums():
        """Fetch all albums with their primary artist's name."""
        return execute_query("""
            SELECT 
                a.album_id, 
                a.album_name, 
                a.release_date, 
                a.cover_url, 
                a.album_type,
                ar.artist_name  -- Get the artist name
            FROM Albums a
            LEFT JOIN Artists ar ON a.artist_id = ar.artist_id -- Join with Artists table
            ORDER BY a.release_date DESC, a.album_name
        """)

# Artist related database operations
class ArtistDB:
    @staticmethod
    def create_artist(artist_name, record_label_id):
        return execute_single("""
            INSERT INTO Artists (artist_name, record_label_id)
            VALUES (%s, %s)
            RETURNING artist_id
        """, (artist_name, record_label_id))['artist_id']

    @staticmethod
    def get_all_artists():
        return execute_query("""
            SELECT a.*, rl.record_label_name,
                   COUNT(DISTINCT al.album_id) as album_count,
                   COUNT(DISTINCT s.song_id) as song_count,
                   COALESCE(SUM(s.stream_count), 0) as total_streams
            FROM Artists a
            LEFT JOIN RecordLabels rl ON a.record_label_id = rl.record_label_id
            LEFT JOIN Albums al ON a.artist_id = al.artist_id
            LEFT JOIN Songs s ON al.album_id = s.album_id
            GROUP BY a.artist_id, rl.record_label_name
            ORDER BY a.artist_name
        """)

    @staticmethod
    def get_artist_by_id(artist_id):
        return execute_single("""
            SELECT a.*, rl.record_label_name,
                   COUNT(DISTINCT al.album_id) as album_count,
                   COUNT(DISTINCT s.song_id) as song_count,
                   COALESCE(SUM(s.stream_count), 0) as total_streams
            FROM Artists a
            LEFT JOIN RecordLabels rl ON a.record_label_id = rl.record_label_id
            LEFT JOIN Albums al ON a.artist_id = al.artist_id
            LEFT JOIN Songs s ON al.album_id = s.album_id
            WHERE a.artist_id = %s
            GROUP BY a.artist_id, rl.record_label_name
        """, (artist_id,))

    @staticmethod
    def get_artists_by_record_label(record_label_id):
        return execute_query("""
            SELECT a.*
            FROM Artists a
            WHERE a.record_label_id = %s
            ORDER BY a.artist_name
        """, (record_label_id,))

# Playlist related database operations
class PlaylistDB:
    @staticmethod
    def create_playlist(playlist_name, user_id, description=None, cover_url=None, public=False):
        return execute_single("""
            INSERT INTO Playlists (playlist_name, user_id, description, cover_url, public)
            VALUES (%s, %s, %s, %s, %s)
            RETURNING playlist_id
        """, (playlist_name, user_id, description, cover_url, public))['playlist_id']

    @staticmethod
    def get_user_playlists(user_id):
        return execute_query("""
            SELECT p.*, 
                   array_agg(json_build_object(
                       'song_id', s.song_id,
                       'title', s.title,
                       'duration', s.duration,
                       'file_url', s.file_url,
                       'artist_name', ar.artist_name
                   )) as songs
            FROM Playlists p
            LEFT JOIN PlaylistContent pc ON p.playlist_id = pc.playlist_id
            LEFT JOIN Songs s ON pc.song_id = s.song_id
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            LEFT JOIN Artists ar ON sa.artist_id = ar.artist_id
            WHERE p.user_id = %s
            GROUP BY p.playlist_id
            ORDER BY p.creation_date DESC
        """, (user_id,))

    @staticmethod
    def add_song_to_playlist(playlist_id, song_id):
        with get_db() as conn:
            conn.execute("""
                INSERT INTO PlaylistContent (playlist_id, song_id)
                VALUES (%s, %s)
            """, (playlist_id, song_id))

    @staticmethod
    def remove_song_from_playlist(playlist_id, song_id):
        with get_db() as conn:
            conn.execute("""
                DELETE FROM PlaylistContent
                WHERE playlist_id = %s AND song_id = %s
            """, (playlist_id, song_id))

    @staticmethod
    def delete_playlist(playlist_id):
        with get_db() as conn:
            conn.execute("""
                DELETE FROM Playlists
                WHERE playlist_id = %s
            """, (playlist_id,))

    @staticmethod
    def update_playlist(playlist_id, playlist_name=None, description=None, cover_url=None, public=None):
        updates = []
        params = []
        
        if playlist_name is not None:
            updates.append("playlist_name = %s")
            params.append(playlist_name)
        if description is not None:
            updates.append("description = %s")
            params.append(description)
        if cover_url is not None:
            updates.append("cover_url = %s")
            params.append(cover_url)
        if public is not None:
            updates.append("public = %s")
            params.append(public)
            
        if updates:
            params.append(playlist_id)
            with get_db() as conn:
                conn.execute(f"""
                    UPDATE Playlists
                    SET {', '.join(updates)}
                    WHERE playlist_id = %s
                """, params)

    @staticmethod
    def get_public_playlists():
        return execute_query("""
            SELECT p.*, u.user_name,
                   array_agg(json_build_object(
                       'song_id', s.song_id,
                       'title', s.title,
                       'duration', s.duration,
                       'file_url', s.file_url,
                       'artist_name', ar.artist_name
                   )) as songs
            FROM Playlists p
            JOIN Users u ON p.user_id = u.user_id
            LEFT JOIN PlaylistContent pc ON p.playlist_id = pc.playlist_id
            LEFT JOIN Songs s ON pc.song_id = s.song_id
            LEFT JOIN Song_Artists sa ON s.song_id = sa.song_id
            LEFT JOIN Artists ar ON sa.artist_id = ar.artist_id
            WHERE p.public = true
            GROUP BY p.playlist_id, u.user_name
            ORDER BY p.creation_date DESC
        """)

# Tour related database operations
class TourDB:
    @staticmethod
    def get_all_tours():
        return execute_query("""
            SELECT t.*, 
                   array_agg(json_build_object(
                       'user_id', u.user_id,
                       'user_name', u.user_name
                   )) as bookings
            FROM Tours t
            LEFT JOIN TourBooking tb ON t.tour_id = tb.tour_id
            LEFT JOIN Users u ON tb.user_id = u.user_id
            GROUP BY t.tour_id
            ORDER BY t.tour_start_date
        """)

    @staticmethod
    def get_tour_by_id(tour_id):
        return execute_single("""
            SELECT t.*, 
                   array_agg(json_build_object(
                       'user_id', u.user_id,
                       'user_name', u.user_name
                   )) as bookings
            FROM Tours t
            LEFT JOIN TourBooking tb ON t.tour_id = tb.tour_id
            LEFT JOIN Users u ON tb.user_id = u.user_id
            WHERE t.tour_id = %s
            GROUP BY t.tour_id
        """, (tour_id,))

    @staticmethod
    def create_tour(tour_name, tour_start_date, tour_end_date, tour_location):
        return execute_single("""
            INSERT INTO Tours (tour_name, tour_start_date, tour_end_date, tour_location)
            VALUES (%s, %s, %s, %s)
            RETURNING tour_id
        """, (tour_name, tour_start_date, tour_end_date, tour_location))['tour_id']

    @staticmethod
    def book_tour(tour_id, user_id):
        with get_db() as conn:
            conn.execute("""
                INSERT INTO TourBooking (tour_id, user_id)
                VALUES (%s, %s)
            """, (tour_id, user_id))

    @staticmethod
    def cancel_booking(booking_id):
        with get_db() as conn:
            conn.execute("""
                DELETE FROM TourBooking
                WHERE booking_id = %s
            """, (booking_id,))

    @staticmethod
    def get_user_bookings(user_id):
        return execute_query("""
            SELECT t.*, tb.booking_id
            FROM Tours t
            JOIN TourBooking tb ON t.tour_id = tb.tour_id
            WHERE tb.user_id = %s
            ORDER BY t.tour_start_date
        """, (user_id,)) 