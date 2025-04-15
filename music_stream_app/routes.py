from flask import Flask, render_template, request, redirect, url_for, session, flash
from db import SongDB, UserDB, execute_query
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/genres')
def genres():
    genres = SongDB.get_all_genres()
    return render_template('genres.html', genres=genres)

@app.route('/genre/<genre>')
def genre_profile(genre):
    songs = SongDB.get_songs_by_genre(genre)
    return render_template('genre_profile.html', genre=genre, songs=songs)

@app.route('/playlists')
def playlists():
    if 'user_id' not in session:
        flash('Please log in to view playlists', 'warning')
        return redirect(url_for('login'))
    
    user_playlists = execute_query("""
        SELECT p.*, 
               (SELECT COUNT(*) FROM PlaylistContent pc WHERE pc.playlist_id = p.playlist_id) as song_count,
               (SELECT s.file_url 
                FROM PlaylistContent pc 
                JOIN Songs s ON s.song_id = pc.song_id 
                WHERE pc.playlist_id = p.playlist_id 
                ORDER BY pc.playlist_id 
                LIMIT 1) as cover_url
        FROM Playlists p
        WHERE p.user_id = %s
        ORDER BY p.creation_date DESC
    """, (session['user_id'],), fetch_all=True)
    
    return render_template('playlists.html', playlists=user_playlists)

@app.route('/playlist/<int:playlist_id>')
def playlist_detail(playlist_id):
    if 'user_id' not in session:
        flash('Please log in to view playlists', 'warning')
        return redirect(url_for('login'))
    
    playlist = execute_query("""
        SELECT p.*, u.user_name,
               (SELECT COUNT(*) FROM PlaylistContent pc WHERE pc.playlist_id = p.playlist_id) as song_count
        FROM Playlists p
        JOIN Users u ON u.user_id = p.user_id
        WHERE p.playlist_id = %s
    """, (playlist_id,), fetch_one=True)
    
    if not playlist:
        flash('Playlist not found', 'error')
        return redirect(url_for('playlists'))
    
    if not playlist['public'] and playlist['user_id'] != session['user_id']:
        flash('You do not have permission to view this playlist', 'error')
        return redirect(url_for('playlists'))
    
    songs = execute_query("""
        SELECT s.*, string_agg(a.artist_name, ', ') as artist_name
        FROM Songs s
        JOIN PlaylistContent pc ON pc.song_id = s.song_id
        LEFT JOIN Song_Artists sa ON sa.song_id = s.song_id
        LEFT JOIN Artists a ON a.artist_id = sa.artist_id
        WHERE pc.playlist_id = %s
        GROUP BY s.song_id
        ORDER BY pc.playlist_id
    """, (playlist_id,), fetch_all=True)
    
    return render_template('playlist_detail.html', playlist=playlist, songs=songs)

@app.route('/playlist/create', methods=['POST'])
def create_playlist():
    if 'user_id' not in session:
        flash('Please log in to create playlists', 'warning')
        return redirect(url_for('login'))
    
    playlist_name = request.form.get('playlist_name')
    public = request.form.get('public') == 'on'
    
    if not playlist_name:
        flash('Playlist name is required', 'error')
        return redirect(url_for('playlists'))
    
    execute_query("""
        INSERT INTO Playlists (playlist_name, user_id, public)
        VALUES (%s, %s, %s)
    """, (playlist_name, session['user_id'], public))
    
    flash('Playlist created successfully', 'success')
    return redirect(url_for('playlists'))

@app.route('/playlist/<int:playlist_id>/edit', methods=['POST'])
def edit_playlist(playlist_id):
    if 'user_id' not in session:
        flash('Please log in to edit playlists', 'warning')
        return redirect(url_for('login'))
    
    playlist = execute_query("""
        SELECT * FROM Playlists WHERE playlist_id = %s
    """, (playlist_id,), fetch_one=True)
    
    if not playlist or playlist['user_id'] != session['user_id']:
        flash('You do not have permission to edit this playlist', 'error')
        return redirect(url_for('playlists'))
    
    playlist_name = request.form.get('playlist_name')
    public = request.form.get('public') == 'on'
    
    if not playlist_name:
        flash('Playlist name is required', 'error')
        return redirect(url_for('playlist_detail', playlist_id=playlist_id))
    
    execute_query("""
        UPDATE Playlists 
        SET playlist_name = %s, public = %s
        WHERE playlist_id = %s
    """, (playlist_name, public, playlist_id))
    
    flash('Playlist updated successfully', 'success')
    return redirect(url_for('playlist_detail', playlist_id=playlist_id))

@app.route('/playlist/<int:playlist_id>/delete', methods=['POST'])
def delete_playlist(playlist_id):
    if 'user_id' not in session:
        flash('Please log in to delete playlists', 'warning')
        return redirect(url_for('login'))
    
    playlist = execute_query("""
        SELECT * FROM Playlists WHERE playlist_id = %s
    """, (playlist_id,), fetch_one=True)
    
    if not playlist or playlist['user_id'] != session['user_id']:
        flash('You do not have permission to delete this playlist', 'error')
        return redirect(url_for('playlists'))
    
    execute_query("""
        DELETE FROM Playlists WHERE playlist_id = %s
    """, (playlist_id,))
    
    flash('Playlist deleted successfully', 'success')
    return redirect(url_for('playlists'))

@app.route('/playlist/<int:playlist_id>/remove/<int:song_id>', methods=['POST'])
def remove_from_playlist(playlist_id, song_id):
    if 'user_id' not in session:
        flash('Please log in to modify playlists', 'warning')
        return redirect(url_for('login'))
    
    playlist = execute_query("""
        SELECT * FROM Playlists WHERE playlist_id = %s
    """, (playlist_id,), fetch_one=True)
    
    if not playlist or playlist['user_id'] != session['user_id']:
        flash('You do not have permission to modify this playlist', 'error')
        return redirect(url_for('playlists'))
    
    execute_query("""
        DELETE FROM PlaylistContent 
        WHERE playlist_id = %s AND song_id = %s
    """, (playlist_id, song_id))
    
    flash('Song removed from playlist', 'success')
    return redirect(url_for('playlist_detail', playlist_id=playlist_id))

@app.route('/tours')
def tours():
    tours = execute_query("""
        SELECT t.*, a.artist_name
        FROM Tours t
        JOIN Artists a ON a.artist_id = t.artist_id
        ORDER BY t.tour_start_date DESC
    """, fetch_all=True)
    return render_template('tours.html', tours=tours)

if __name__ == '__main__':
    app.run(debug=True) 