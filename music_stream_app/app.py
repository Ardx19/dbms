from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from werkzeug.security import generate_password_hash, check_password_hash
import os
from dotenv import load_dotenv
from db import UserDB, SongDB, PlaylistDB, AlbumDB, ArtistDB, TourDB
import psycopg

load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'your-secret-key-here')

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

@app.route('/songs/<int:song_id>/stream', methods=['POST'])
@login_required
def stream_song(song_id):
    try:
        SongDB.increment_stream_count(song_id)
        return jsonify({'status': 'success'})
    except psycopg.Error as e:
        return str(e), 400

@app.route('/albums')
def albums():
    albums = AlbumDB.get_all_albums()
    return render_template('albums.html', albums=albums)

@app.route('/artists')
def artists():
    artists = ArtistDB.get_all_artists()
    return render_template('artists.html', artists=artists)

@app.route('/genres')
def genres():
    genres = SongDB.get_all_genres()
    return render_template('genres.html', genres=genres)

@app.route('/tours')
def tours():
    tours = TourDB.get_all_tours()
    return render_template('tours.html', tours=tours)

if __name__ == '__main__':
    app.run(debug=True) 
