-- Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    pfp_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    offline_songs TEXT,
    premium BOOLEAN DEFAULT FALSE
);

-- Record Labels Table
CREATE TABLE RecordLabels (
    record_label_id SERIAL PRIMARY KEY,
    record_label_name VARCHAR(255) NOT NULL
);

-- Artists Table
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    record_label_id INT REFERENCES RecordLabels(record_label_id) ON DELETE SET NULL
);

-- Playlists Table
CREATE TABLE Playlists (
    playlist_id SERIAL PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    description TEXT,
    cover_url VARCHAR(255),
    public BOOLEAN DEFAULT FALSE
);

-- Albums Table
CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    release_date TIMESTAMP,
    cover_url VARCHAR(255),
    artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
    record_label_id INT REFERENCES RecordLabels(record_label_id) ON DELETE SET NULL,
    album_type VARCHAR(100) NOT NULL
);

-- Songs Table
CREATE TABLE Songs (
    song_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration VARCHAR(255) NOT NULL,
    language VARCHAR(100) NOT NULL,
    rating DOUBLE PRECISION,
    album_id INT,
    music_video_url VARCHAR(255),
    genre VARCHAR(100) NOT NULL,
    file_url VARCHAR(255) NOT NULL,
    release_date TIMESTAMP,
    stream_count BIGINT DEFAULT 0,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE SET NULL
);

-- Song_Artists (Many-to-Many: Songs <-> Artists)
CREATE TABLE Song_Artists (
    song_id INT REFERENCES Songs(song_id) ON DELETE CASCADE,
    artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
    PRIMARY KEY (song_id, artist_id)
);

-- PlaylistContent Table (Many-to-Many: Playlists <-> Songs)
CREATE TABLE PlaylistContent (
    playlist_id INT REFERENCES Playlists(playlist_id) ON DELETE CASCADE,
    song_id INT REFERENCES Songs(song_id) ON DELETE CASCADE,
    PRIMARY KEY (playlist_id, song_id)
);

-- Genres Table
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Tours Table
CREATE TABLE Tours (
    tour_id SERIAL PRIMARY KEY,
    tour_name VARCHAR(255) NOT NULL,
    tour_start_date TIMESTAMP NOT NULL,
    tour_end_date TIMESTAMP NOT NULL,
    tour_location VARCHAR(255) NOT NULL
);

-- TourBooking Table (Many-to-Many: Users <-> Tours)
CREATE TABLE TourBooking (
    booking_id SERIAL PRIMARY KEY,
    tour_id INT REFERENCES Tours(tour_id) ON DELETE CASCADE,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE
);

-- LikedSongs Table (Many-to-Many: Users <-> Songs)
CREATE TABLE LikedSongs (
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    song_id INT REFERENCES Songs(song_id) ON DELETE CASCADE,
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, song_id)
);

-- INDEXES

CREATE INDEX idx_songs_album_id ON Songs(album_id);
CREATE INDEX idx_songs_genre ON Songs(genre);
CREATE INDEX idx_playlists_user_id ON Playlists(user_id);
-- CREATE INDEX idx_tourbooking_user_id ON TourBooking(user_id);
CREATE INDEX idx_likedsongs_user_id ON LikedSongs(user_id);

INSERT INTO Users (user_name, email, password_hash, pfp_url, premium) VALUES
    ('Alice', 'alice@example.com', 'hash1', 'url1', FALSE),
    ('Bob', 'bob@example.com', 'hash2', 'url2', TRUE),
    ('Charlie', 'charlie@example.com', 'hash3', 'url3', FALSE),
    ('Diana', 'diana@example.com', 'hash4', 'url4', TRUE),
    ('Eve', 'eve@example.com', 'hash5', 'url5', FALSE);

INSERT INTO RecordLabels (record_label_name) VALUES
    ('Universal Music'),
    ('Sony Music'),
    ('Warner Music'),
    ('EMI'),
    ('BMG');

INSERT INTO Artists (artist_name, record_label_id) VALUES
    ('Adele', 1),
    ('Drake', 2),
    ('Taylor Swift', 3),
    ('Ed Sheeran', 4),
    ('Beyoncé', 5);

INSERT INTO Playlists (playlist_name, user_id, description) VALUES
    ('Chill Vibes', 1, 'Relaxing tracks'),
    ('Workout Mix', 2, 'High energy songs'),
    ('Love Songs', 3, 'Romantic hits'),
    ('Party Time', 4, 'Upbeat and fun'),
    ('Focus Mode', 5, 'Concentration boosters');

INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type) VALUES
    ('30', '2021-11-19', 'cover1', 1, 1, 'Studio'),
    ('Certified Lover Boy', '2021-09-03', 'cover2', 2, 2, 'Studio'),
    ('Evermore', '2020-12-11', 'cover3', 3, 3, 'Studio'),
    ('Divide', '2017-03-03', 'cover4', 4, 4, 'Studio'),
    ('Renaissance', '2022-07-29', 'cover5', 5, 5, 'Studio');

INSERT INTO Songs (title, duration, language, rating, album_id, music_video_url, genre, file_url, release_date, stream_count) VALUES
    ('Easy On Me', '3:44', 'English', 9.5, 1, 'mv1', 'Pop', 'file1', '2021-10-15', 1000000),
    ('Way 2 Sexy', '4:17', 'English', 8.2, 2, 'mv2', 'Hip-Hop', 'file2', '2021-09-03', 950000),
    ('Willow', '3:34', 'English', 9.0, 3, 'mv3', 'Folk', 'file3', '2020-12-11', 800000),
    ('Shape of You', '3:53', 'English', 9.8, 4, 'mv4', 'Pop', 'file4', '2017-01-06', 2000000),
    ('Break My Soul', '4:38', 'English', 9.1, 5, 'mv5', 'Dance', 'file5', '2022-06-20', 870000);

INSERT INTO Song_Artists (song_id, artist_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO PlaylistContent (playlist_id, song_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO Genres (genre_name) VALUES
    ('Pop'),
    ('Hip-Hop'),
    ('Folk'),
    ('Dance'),
    ('Rock');

INSERT INTO Tours (tour_name, tour_start_date, tour_end_date, tour_location) VALUES
    ('Adele World Tour', '2022-05-01', '2022-08-01', 'USA'),
    ('Drake Live', '2023-03-15', '2023-06-15', 'Canada'),
    ('TS Evermore Tour', '2023-07-01', '2023-10-01', 'USA'),
    ('Ed Europe Tour', '2024-01-01', '2024-04-01', 'Europe'),
    ('Beyoncé Renaissance Tour', '2024-05-10', '2024-08-10', 'Worldwide');

INSERT INTO TourBooking (tour_id, user_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO RecordLabels (record_label_name) VALUES ('XO Records'); -- Assuming XO is the label
INSERT INTO Artists (artist_name, record_label_id) VALUES ('The Weeknd', 6);

INSERT INTO Genres (genre_name) VALUES
('Synthwave'),
('R&B');

INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
VALUES ('After Hours', '2020-03-20', 'https://example.com/after_hours_cover.jpg', 6, 6, 'Studio');

INSERT INTO Songs (title, duration, language, rating, album_id, music_video_url, genre, file_url, release_date, stream_count) VALUES
('Blinding Lights', '3:20', 'English', 9.8, 6, 'https://example.com/bl_mv', 'Synthwave', 'https://example.com/bl_file', '2020-03-20', 3500000000),
('Heartless', '3:18', 'English', 8.9, 6, 'https://example.com/heartless_mv', 'Hip-Hop', 'https://example.com/heartless_file', '2020-03-20', 950000000),
('Save Your Tears', '3:35', 'English', 9.4, 6, 'https://example.com/syt_mv', 'Pop', 'https://example.com/syt_file', '2020-03-20', 2000000000),
('In Your Eyes', '3:57', 'English', 9.1, 6, 'https://example.com/iye_mv', 'Pop', 'https://example.com/iye_file', '2020-03-20', 800000000),
('After Hours', '6:01', 'English', 9.5, 6, 'https://example.com/ah_mv', 'R&B', 'https://example.com/ah_file', '2020-03-20', 700000000);

INSERT INTO Song_Artists (song_id, artist_id) VALUES
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6);

INSERT INTO Playlists (playlist_name, user_id, description) VALUES
('After Hours Vibes', 1, 'The Weeknd hits from After Hours');

INSERT INTO PlaylistContent (playlist_id, song_id) VALUES
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10);