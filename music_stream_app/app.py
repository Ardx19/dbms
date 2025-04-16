from flask import Flask, render_template, request, jsonify, redirect, url_for, send_from_directory
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from werkzeug.security import generate_password_hash, check_password_hash
import os
from dotenv import load_dotenv
from db import UserDB, SongDB, PlaylistDB, AlbumDB, ArtistDB, TourDB
from spotify_api import spotify_api
import psycopg
from datetime import datetime

load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'your-secret-key-here')

# Add custom filter for formatting numbers
@app.template_filter('format_number')
def format_number(value):
    if value is None:
        return "0"
    return "{:,}".format(int(value))

@app.template_filter('format_duration')
def format_duration(seconds):
    if not seconds:
        return "0:00"
    try:
        # Convert to integer if it's a string
        seconds = int(seconds)
        minutes = seconds // 60
        seconds = seconds % 60
        return f"{minutes}:{seconds:02d}"
    except (ValueError, TypeError):
        return "0:00"

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

# User class for Flask-Login
class User(UserMixin):
    def __init__(self, user_data):
        self.id = user_data['user_id']
        self.username = user_data['user_name']
        self.email = user_data['email']
        self.premium = user_data['premium']
        self._user_data = user_data

@login_manager.user_loader
def load_user(user_id):
    user_data = UserDB.get_user_by_id(int(user_id))
    return User(user_data) if user_data else None

# Routes
@app.route('/')
def index():
    songs = SongDB.get_all_songs()
    # Update songs with album art from Spotify
    for song in songs:
        if not song.get('cover_url'):
            spotify_data = spotify_api.search_track(song['title'], song['artist_name'])
            if spotify_data:
                song['cover_url'] = spotify_data['cover_url']
    
    if current_user.is_authenticated:
        playlists = PlaylistDB.get_user_playlists(current_user.id)
    else:
        playlists = []
    return render_template('index.html', songs=songs, playlists=playlists)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        user_data = UserDB.get_user_by_username(username)
        
        if user_data and check_password_hash(user_data['password_hash'], password):
            login_user(User(user_data))
            return redirect(url_for('index'))
        
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        
        password_hash = generate_password_hash(password)
        try:
            user_id = UserDB.create_user(username, email, password_hash)
            user_data = UserDB.get_user_by_id(user_id)
            login_user(User(user_data))
            return redirect(url_for('index'))
        except psycopg.errors.UniqueViolation:
            return "Username or email already exists", 400
    
    return render_template('register.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/playlist/create', methods=['POST'])
@login_required
def create_playlist():
    name = request.form.get('name')
    description = request.form.get('description')
    cover_url = request.form.get('cover_url')
    public = request.form.get('public', 'false').lower() == 'true'
    
    PlaylistDB.create_playlist(name, current_user.id, description, cover_url, public)
    return redirect(url_for('index'))

@app.route('/playlist/<int:playlist_id>/add/<int:song_id>', methods=['POST'])
@login_required
def add_to_playlist(playlist_id, song_id):
    try:
        PlaylistDB.add_song_to_playlist(playlist_id, song_id)
        return redirect(url_for('index'))
    except psycopg.Error as e:
        return str(e), 400

@app.route('/playlist/<int:playlist_id>/remove/<int:song_id>', methods=['POST'])
@login_required
def remove_from_playlist(playlist_id, song_id):
    try:
        PlaylistDB.remove_song_from_playlist(playlist_id, song_id)
        return redirect(url_for('index'))
    except psycopg.Error as e:
        return str(e), 400

@app.route('/playlist/<int:playlist_id>/delete', methods=['POST'])
@login_required
def delete_playlist(playlist_id):
    try:
        PlaylistDB.delete_playlist(playlist_id)
        return redirect(url_for('index'))
    except psycopg.Error as e:
        return str(e), 400

@app.route('/playlist/<int:playlist_id>/update', methods=['POST'])
@login_required
def update_playlist(playlist_id):
    try:
        name = request.form.get('name')
        description = request.form.get('description')
        cover_url = request.form.get('cover_url')
        public = request.form.get('public')
        
        PlaylistDB.update_playlist(
            playlist_id,
            playlist_name=name,
            description=description,
            cover_url=cover_url,
            public=public
        )
        return redirect(url_for('index'))
    except psycopg.Error as e:
        return str(e), 400
    

@app.route('/liked_songs')
@login_required
def liked_songs():
    # --- Database Logic ---
    # Replace this with your actual query to get liked songs for the current user
    # Example: liked_songs_data = LikedSong.query.filter_by(user_id=current_user.id).join(Song).all()
    
    # --- Placeholder Data (Remove when you have real data) ---
    liked_songs_data = [
        {'id': 1, 'title': 'Bohemian Rhapsody', 'artist_name': 'Queen', 'album_name': 'A Night at the Opera', 'album_cover_url': 'https://via.placeholder.com/40', 'date_added': '2025-04-10', 'duration_formatted': '5:55', 'preview_url': '...'},
        {'id': 2, 'title': 'Stairway to Heaven', 'artist_name': 'Led Zeppelin', 'album_name': 'Led Zeppelin IV', 'album_cover_url': 'https://via.placeholder.com/40', 'date_added': '2025-04-11', 'duration_formatted': '8:02', 'preview_url': '...'},
        {'id': 3, 'title': 'Hotel California', 'artist_name': 'Eagles', 'album_name': 'Hotel California', 'album_cover_url': 'https://via.placeholder.com/40', 'date_added': '2025-04-12', 'duration_formatted': '6:30', 'preview_url': '...'},
    ]
    # --- End Placeholder Data ---

    return render_template('liked_songs.html', liked_songs=liked_songs_data)

@app.route('/songs/<int:song_id>/stream', methods=['POST'])
@login_required
def stream_song(song_id):
    try:
        SongDB.increment_stream_count(song_id)
        return jsonify({'status': 'success'})
    except psycopg.Error as e:
        return str(e), 400

@app.route('/static/songs/<filename>')
def serve_song(filename):
    return send_from_directory('static/songs', filename)

@app.route('/albums')
def albums():
    # Get all albums from database
    albums = AlbumDB.get_all_albums()
    
    # Update albums with Spotify data and sort by release date
    for album in albums:
        # Always fetch fresh data from Spotify to ensure we have the latest images
        spotify_data = spotify_api.search_album(album['album_name'], album['artist_name'])
        if spotify_data:
            # Update album data with Spotify information
            album.update({
                'cover_url': spotify_data['cover_url'],
                'release_date': spotify_data['release_date'],
                'total_tracks': spotify_data['total_tracks']
            })
    
    # Sort albums by release date (newest first)
    def get_date(album):
        date_str = album.get('release_date', '')
        try:
            # Try to parse the date string into a datetime object
            return datetime.strptime(date_str, '%Y-%m-%d')
        except (ValueError, TypeError):
            # If parsing fails, return a very old date
            return datetime.min
    
    albums.sort(key=get_date, reverse=True)
    
    return render_template('albums.html', albums=albums)

@app.route('/album/<int:album_id>')
def album_profile(album_id):
    # Get album data from database
    album = AlbumDB.get_album_by_id(album_id)
    if not album:
        return render_template('error.html', message="Album not found"), 404
    
    # Get additional album data from Spotify
    spotify_data = spotify_api.search_album(album['album_name'], album['artist_name'])
    if spotify_data:
        album.update(spotify_data)
    
    # Get album tracks
    tracks = SongDB.get_songs_by_album(album_id)
    
    return render_template('album_page.html', album=album, tracks=tracks)

@app.route('/artists')
def artists():
    artists = ArtistDB.get_all_artists()
    # Update artists with images from Spotify
    for artist in artists:
        if not artist.get('pfp_url'):
            spotify_data = spotify_api.search_artist(artist['artist_name'])
            if spotify_data and spotify_data.get('image_url'):
                artist['pfp_url'] = spotify_data['image_url']
                if spotify_data.get('genres'):
                    artist['genre'] = ', '.join(spotify_data['genres'][:2])
    return render_template('artists.html', artists=artists)

@app.route('/artist/<int:artist_id>')
def artist_page(artist_id):
    artist = ArtistDB.get_artist_by_id(artist_id)
    albums = AlbumDB.get_albums_by_artist(artist_id)
    
    # Update artist image from Spotify
    if not artist.get('pfp_url'):
        spotify_data = spotify_api.search_artist(artist['artist_name'])
        if spotify_data and spotify_data.get('image_url'):
            artist['pfp_url'] = spotify_data['image_url']
            if spotify_data.get('genres'):
                artist['genre'] = ', '.join(spotify_data['genres'][:2])
    
    # Update album covers from Spotify
    for album in albums:
        if not album.get('cover_url'):
            spotify_data = spotify_api.search_album(album['album_name'], artist['artist_name'])
            if spotify_data:
                if spotify_data.get('cover_url'):
                    album['cover_url'] = spotify_data['cover_url']
                if spotify_data.get('release_date'):
                    album['release_date'] = spotify_data.get('release_date')
                # Update the album in the database
                try:
                    AlbumDB.update_album(
                        album['album_id'],
                        cover_url=spotify_data.get('cover_url'),
                        release_date=spotify_data.get('release_date')
                    )
                except Exception as e:
                    print(f"Error updating album: {e}")
    
    return render_template('artist_page.html', artist=artist, albums=albums)

@app.route('/genres')
def genres():
    """Display songs grouped by genres."""
    all_songs = SongDB.get_all_songs()



    if all_songs:
        print("Fetching missing cover URLs for /genres...") # Optional: keep for confirmation
        for song in all_songs:
            if not song.get('cover_url'): # Check if cover_url is missing
                # Fetch from Spotify if missing
                try:
                    # Use the same logic as the index route
                    spotify_data = spotify_api.search_track(song.get('title', ''), song.get('artist_name', ''))
                    if spotify_data and spotify_data.get('cover_url'):
                        song['cover_url'] = spotify_data['cover_url'] # Update the song dictionary
                        # print(f"Updated cover for {song.get('title')}: {song['cover_url']}") # Debug
                    # else:
                        # print(f"No Spotify cover found for {song.get('title')}") # Debug
                except Exception as e:
                    print(f"Error fetching Spotify data for {song.get('title')}: {e}") # Handle potential API errors
        print("Finished fetching covers.") # Optional

    # if all_songs:
    #     print("\n--- Debugging /genres route ---")
    #     # Print details for the first 5 songs fetched
    #     for i, song_debug in enumerate(all_songs[:5]):
    #          print(f"Song {i+1} Title: {song_debug.get('title')}, Cover URL: {song_debug.get('cover_url')}")
    #     print("-----------------------------\n")
    
    # Group songs by genre
    genres_dict = {}
    if all_songs:
        for song in all_songs:
            # Handle potential None or empty genres
            genre = song.get('genre') if song.get('genre') else 'Uncategorized' 
            if genre not in genres_dict:
                genres_dict[genre] = []
            genres_dict[genre].append(song)
    
    # Sort genres alphabetically for display order
    # Put 'Uncategorized' last if it exists
    sorted_genres = sorted(g for g in genres_dict.keys() if g != 'Uncategorized')
    if 'Uncategorized' in genres_dict:
        sorted_genres.append('Uncategorized')

    return render_template('genres.html', 
                           genres_dict=genres_dict, 
                           sorted_genres=sorted_genres)

@app.route('/tours')
def tours():
    tours = TourDB.get_all_tours()
    return render_template('tours.html', tours=tours)

@app.route('/profile')
@login_required
def profile():
    user_data = UserDB.get_user_by_id(current_user.id)
    return render_template('profile.html', user=user_data)

if __name__ == '__main__':
    app.run(debug=True)
