
INSERT INTO RecordLabels (record_label_name)
SELECT 'Republic Records'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Republic Records'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Republic Records' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'After Hours',
    '2020-03-20',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Republic Records' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'After Hours'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Alone Again',
    '4:10',
    'English',
    'Pop',
    'https://example.com/audio/aloneAgain.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Alone Again'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Alone Again'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Alone Again'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Too Late',
    '3:59',
    'English',
    'Pop',
    'https://example.com/audio/tooLate.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Too Late'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Too Late'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Too Late'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hardest to Love',
    '3:31',
    'English',
    'Pop',
    'https://example.com/audio/hardestToLove.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hardest to Love'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hardest to Love'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hardest to Love'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Scared to Live',
    '3:11',
    'English',
    'Pop',
    'https://example.com/audio/scaredToLive.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Scared to Live'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Scared to Live'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Scared to Live'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Snowchild',
    '4:07',
    'English',
    'Pop',
    'https://example.com/audio/snowchild.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Snowchild'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Snowchild'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Snowchild'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Escape from LA',
    '5:55',
    'English',
    'Pop',
    'https://example.com/audio/escapeFromLA.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Escape from LA'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Escape from LA'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Escape from LA'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Heartless',
    '3:18',
    'English',
    'Pop',
    'https://example.com/audio/heartless.mp3',
    '2019-11-27',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Heartless'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Heartless'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Heartless'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Faith',
    '4:43',
    'English',
    'Pop',
    'https://example.com/audio/faith.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Faith'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Faith'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Faith'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Blinding Lights',
    '3:20',
    'English',
    'Pop',
    'https://example.com/audio/blindingLights.mp3',
    '2019-11-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Blinding Lights'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Blinding Lights'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Blinding Lights'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'In Your Eyes',
    '3:57',
    'English',
    'Pop',
    'https://example.com/audio/inYourEyes.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'In Your Eyes'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'In Your Eyes'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'In Your Eyes'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Save Your Tears',
    '3:35',
    'English',
    'Pop',
    'https://example.com/audio/saveYourTears.mp3',
    '2020-08-09',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Save Your Tears'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Save Your Tears'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Save Your Tears'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Repeat After Me (Interlude)',
    '3:15',
    'English',
    'Pop',
    'https://example.com/audio/repeatAfterMe.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Repeat After Me (Interlude)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Repeat After Me (Interlude)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Repeat After Me (Interlude)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'After Hours',
    '6:01',
    'English',
    'Pop',
    'https://example.com/audio/afterHours.mp3',
    '2020-02-19',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'After Hours'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'After Hours'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'After Hours'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Until I Bleed Out',
    '3:12',
    'English',
    'Pop',
    'https://example.com/audio/untilIBleedOut.mp3',
    '2020-03-20',
    (SELECT album_id FROM Albums
     WHERE album_name = 'After Hours'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Until I Bleed Out'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'After Hours'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Until I Bleed Out'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'After Hours'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Until I Bleed Out'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'After Hours'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Universal Republic'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Universal Republic'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'My Dear Melancholy',
    '2018-03-30',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'My Dear Melancholy'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Call Out My Name',
    '3:48',
    'English',
    'Alternative R&B',
    'https://example.com/audio/callOutMyName.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Call Out My Name'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Call Out My Name'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Call Out My Name'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Try Me',
    '3:41',
    'English',
    'Alternative R&B',
    'https://example.com/audio/tryMe.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Try Me'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Try Me'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Try Me'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Wasted Times',
    '3:40',
    'English',
    'Alternative R&B',
    'https://example.com/audio/wastedTimes.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Wasted Times'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Wasted Times'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Wasted Times'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'I Was Never There (feat. Gesaffelstein)',
    '4:01',
    'English',
    'Alternative R&B',
    'https://example.com/audio/iWasNeverThere.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'I Was Never There (feat. Gesaffelstein)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'I Was Never There (feat. Gesaffelstein)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'I Was Never There (feat. Gesaffelstein)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hurt You (feat. Gesaffelstein)',
    '3:50',
    'English',
    'Alternative R&B',
    'https://example.com/audio/hurtYou.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hurt You (feat. Gesaffelstein)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hurt You (feat. Gesaffelstein)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hurt You (feat. Gesaffelstein)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Privilege',
    '2:50',
    'English',
    'Alternative R&B',
    'https://example.com/audio/privilege.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Privilege'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Privilege'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Privilege'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Universal Republic'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Universal Republic'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Starboy',
    '2016-11-25',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Starboy'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Starboy (feat. Daft Punk)',
    '3:50',
    'English',
    'Pop',
    'https://example.com/audio/starboy.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Starboy (feat. Daft Punk)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Starboy (feat. Daft Punk)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Starboy (feat. Daft Punk)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Party Monster',
    '3:13',
    'English',
    'R&B',
    'https://example.com/audio/partyMonster.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Party Monster'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Party Monster'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Party Monster'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'False Alarm',
    '3:38',
    'English',
    'Pop',
    'https://example.com/audio/falseAlarm.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'False Alarm'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'False Alarm'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'False Alarm'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Reminder',
    '3:43',
    'English',
    'R&B',
    'https://example.com/audio/reminder.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Reminder'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Reminder'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Reminder'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Rockin'',
    '3:33',
    'English',
    'R&B',
    'https://example.com/audio/rockin.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Rockin''
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Rockin''
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Rockin''
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Secrets',
    '3:23',
    'English',
    'Pop',
    'https://example.com/audio/secrets.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Secrets'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Secrets'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Secrets'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'True Colors',
    '3:30',
    'English',
    'R&B',
    'https://example.com/audio/trueColors.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'True Colors'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'True Colors'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'True Colors'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hoodrich Pablo Juan',
    '3:44',
    'English',
    'Pop',
    'https://example.com/audio/hoodrichPabloJuan.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hoodrich Pablo Juan'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hoodrich Pablo Juan'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hoodrich Pablo Juan'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'A Lonely Night',
    '3:55',
    'English',
    'R&B',
    'https://example.com/audio/aLonelyNight.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'A Lonely Night'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'A Lonely Night'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'A Lonely Night'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Attention',
    '4:10',
    'English',
    'Pop',
    'https://example.com/audio/attention.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Attention'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Attention'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Attention'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Ordinary Life',
    '3:56',
    'English',
    'Pop',
    'https://example.com/audio/ordinaryLife.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Ordinary Life'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Ordinary Life'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Ordinary Life'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Nothing Without You',
    '3:20',
    'English',
    'Pop',
    'https://example.com/audio/nothingWithoutYou.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Nothing Without You'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Nothing Without You'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Nothing Without You'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'All I Know (feat. Future)',
    '3:33',
    'English',
    'Rap',
    'https://example.com/audio/allIKnow.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'All I Know (feat. Future)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'All I Know (feat. Future)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'All I Know (feat. Future)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Die for You',
    '4:20',
    'English',
    'R&B',
    'https://example.com/audio/dieForYou.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Die for You'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Die for You'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Die for You'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'I Feel It Coming (feat. Daft Punk)',
    '4:29',
    'English',
    'Pop',
    'https://example.com/audio/iFeelItComing.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'I Feel It Coming (feat. Daft Punk)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'I Feel It Coming (feat. Daft Punk)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'I Feel It Coming (feat. Daft Punk)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Cash Money Records/Young Money Ent./Universal Rec'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'Drake', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'Drake'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Take Care',
    '2011-11-15',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Take Care'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Over My Dead Body',
    '4:43',
    'English',
    'Hip Hop',
    'https://example.com/audio/overMyDeadBody.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Over My Dead Body'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Over My Dead Body'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Over My Dead Body'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Shot for Me',
    '3:34',
    'English',
    'R&B',
    'https://example.com/audio/shotForMe.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Shot for Me'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Shot for Me'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Shot for Me'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Headlines',
    '4:00',
    'English',
    'Hip Hop',
    'https://example.com/audio/headlines.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Headlines'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Headlines'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Headlines'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Crew Love (feat. The Weeknd)',
    '5:29',
    'English',
    'R&B',
    'https://example.com/audio/crewLove.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Crew Love (feat. The Weeknd)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Crew Love (feat. The Weeknd)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Crew Love (feat. The Weeknd)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Take Care (feat. Rihanna)',
    '4:37',
    'English',
    'Hip Hop',
    'https://example.com/audio/takeCare.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Take Care (feat. Rihanna)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Take Care (feat. Rihanna)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Take Care (feat. Rihanna)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Love Yours',
    '4:29',
    'English',
    'Hip Hop',
    'https://example.com/audio/loveYours.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Love Yours'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Love Yours'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Love Yours'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Marvins Room',
    '5:45',
    'English',
    'R&B',
    'https://example.com/audio/marvinsRoom.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Marvins Room'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Marvins Room'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Marvins Room'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Under Ground Kings',
    '4:12',
    'English',
    'Hip Hop',
    'https://example.com/audio/underGroundKings.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Under Ground Kings'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Under Ground Kings'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Under Ground Kings'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'We'll Be Fine (feat. Birdman)',
    '3:39',
    'English',
    'Hip Hop',
    'https://example.com/audio/wellBeFine.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'We'll Be Fine (feat. Birdman)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'We'll Be Fine (feat. Birdman)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'We'll Be Fine (feat. Birdman)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Make Me Proud (feat. Nicki Minaj)',
    '3:49',
    'English',
    'Hip Hop',
    'https://example.com/audio/makeMeProud.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Lord Knows (feat. Rick Ross)',
    '6:05',
    'English',
    'Hip Hop',
    'https://example.com/audio/lordKnows.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Lord Knows (feat. Rick Ross)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Lord Knows (feat. Rick Ross)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Lord Knows (feat. Rick Ross)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Cameras / Good Ones Go (Interlude)',
    '5:41',
    'English',
    'R&B',
    'https://example.com/audio/camerasGoodOnesGo.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Cameras / Good Ones Go (Interlude)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Cameras / Good Ones Go (Interlude)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Cameras / Good Ones Go (Interlude)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Doing It Wrong',
    '3:43',
    'English',
    'R&B',
    'https://example.com/audio/doingItWrong.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Doing It Wrong'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Doing It Wrong'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Doing It Wrong'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'The Ride',
    '5:10',
    'English',
    'Hip Hop',
    'https://example.com/audio/theRide.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'The Ride'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'The Ride'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'The Ride'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Look What You've Done',
    '5:23',
    'English',
    'Hip Hop',
    'https://example.com/audio/lookWhatYouveDone.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Look What You've Done'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Look What You've Done'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Look What You've Done'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)',
    '3:23',
    'English',
    'Hip Hop',
    'https://example.com/audio/hyfr.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Practice',
    '3:54',
    'English',
    'R&B',
    'https://example.com/audio/practice.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Practice'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Practice'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Practice'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'The Ride',
    '4:12',
    'English',
    'R&B',
    'https://example.com/audio/theRideAlternate.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'The Ride'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'The Ride'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'The Ride'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Young Money Entertainment'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'Drake', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'Drake'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Views',
    '2016-04-29',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Views'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Keep the Family Close',
    '6:07',
    'English',
    'Hip Hop',
    'https://example.com/audio/keepTheFamilyClose.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Keep the Family Close'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Keep the Family Close'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Keep the Family Close'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    '9',
    '3:14',
    'English',
    'Hip Hop',
    'https://example.com/audio/9.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = '9'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = '9'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = '9'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'U with Me?',
    '3:30',
    'English',
    'R&B',
    'https://example.com/audio/uWithMe.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'U with Me?'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'U with Me?'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'U with Me?'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Feel No Ways',
    '4:11',
    'English',
    'Hip Hop',
    'https://example.com/audio/feelNoWays.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Feel No Ways'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Feel No Ways'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Feel No Ways'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hype',
    '3:25',
    'English',
    'Hip Hop',
    'https://example.com/audio/hype.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hype'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hype'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hype'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Weston Road Flows',
    '4:44',
    'English',
    'Hip Hop',
    'https://example.com/audio/westonRoadFlows.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Weston Road Flows'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Weston Road Flows'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Weston Road Flows'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Redemption',
    '5:47',
    'English',
    'R&B',
    'https://example.com/audio/redemption.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Redemption'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Redemption'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Redemption'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'With You (feat. PARTYNEXTDOOR)',
    '4:03',
    'English',
    'R&B',
    'https://example.com/audio/withYou.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'With You (feat. PARTYNEXTDOOR)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'With You (feat. PARTYNEXTDOOR)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'With You (feat. PARTYNEXTDOOR)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Still Here',
    '4:32',
    'English',
    'Hip Hop',
    'https://example.com/audio/stillHere.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Still Here'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Still Here'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Still Here'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Controlla',
    '4:05',
    'English',
    'Dancehall',
    'https://example.com/audio/controlla.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Controlla'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Controlla'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Controlla'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'One Dance (feat. Wizkid & Kyla)',
    '2:54',
    'English',
    'Dancehall',
    'https://example.com/audio/oneDance.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'One Dance (feat. Wizkid & Kyla)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'One Dance (feat. Wizkid & Kyla)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'One Dance (feat. Wizkid & Kyla)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Grammys (feat. Future)',
    '3:03',
    'English',
    'Hip Hop',
    'https://example.com/audio/grammys.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Grammys (feat. Future)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Grammys (feat. Future)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Grammys (feat. Future)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Child's Play (feat. Gucci Mane)',
    '4:03',
    'English',
    'Hip Hop',
    'https://example.com/audio/childsPlay.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Child's Play (feat. Gucci Mane)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Child's Play (feat. Gucci Mane)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Child's Play (feat. Gucci Mane)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Pop Style (feat. The Throne)',
    '4:22',
    'English',
    'Hip Hop',
    'https://example.com/audio/popStyle.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Pop Style (feat. The Throne)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Pop Style (feat. The Throne)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Pop Style (feat. The Throne)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Too Good (feat. Rihanna)',
    '3:41',
    'English',
    'Dancehall',
    'https://example.com/audio/tooGood.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Too Good (feat. Rihanna)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Too Good (feat. Rihanna)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Too Good (feat. Rihanna)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Summer's Over Interlude',
    '2:32',
    'English',
    'R&B',
    'https://example.com/audio/summersOver.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Summer's Over Interlude'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Summer's Over Interlude'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Summer's Over Interlude'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Fire & Desire',
    '6:09',
    'English',
    'R&B',
    'https://example.com/audio/fireAndDesire.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Fire & Desire'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Fire & Desire'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Fire & Desire'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Views',
    '5:01',
    'English',
    'Hip Hop',
    'https://example.com/audio/views.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Views'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Views'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Views'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Republic Records'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Republic Records'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Republic Records' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Hurry Up Tomorrow',
    '2025-01-31',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Republic Records' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Hurry Up Tomorrow'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Wake Me Up (feat. Justice)',
    '5:08',
    'English',
    'Pop',
    'https://example.com/audio/wakeMeUp.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Wake Me Up (feat. Justice)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Wake Me Up (feat. Justice)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Wake Me Up (feat. Justice)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Cry For Me',
    '3:44',
    'English',
    'Pop',
    'https://example.com/audio/cryForMe.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Cry For Me'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Cry For Me'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Cry For Me'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'I Can't F*****g Sing',
    '0:12',
    'English',
    'Pop',
    'https://example.com/audio/iCantFingSing.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'I Can't F*****g Sing'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'I Can't F*****g Sing'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'I Can't F*****g Sing'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'São Paulo (feat. Anitta)',
    '5:01',
    'English',
    'Pop',
    'https://example.com/audio/saoPaulo.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'São Paulo (feat. Anitta)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'São Paulo (feat. Anitta)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'São Paulo (feat. Anitta)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Until We're Skin & Bones',
    '3:50',
    'English',
    'Pop',
    'https://example.com/audio/untilWereSkinAndBones.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Until We're Skin & Bones'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Until We're Skin & Bones'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Until We're Skin & Bones'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Baptized In Fear',
    '4:15',
    'English',
    'Pop',
    'https://example.com/audio/baptizedInFear.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Baptized In Fear'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Baptized In Fear'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Baptized In Fear'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Open Hearts',
    '3:29',
    'English',
    'Pop',
    'https://example.com/audio/openHearts.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Open Hearts'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Open Hearts'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Open Hearts'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Opening Night',
    '3:45',
    'English',
    'Pop',
    'https://example.com/audio/openingNight.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Opening Night'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Opening Night'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Opening Night'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Timeless (feat. Playboi Carti)',
    '4:16',
    'English',
    'Pop',
    'https://example.com/audio/timeless.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Timeless (feat. Playboi Carti)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Timeless (feat. Playboi Carti)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Timeless (feat. Playboi Carti)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Africa',
    '3:22',
    'English',
    'Pop',
    'https://example.com/audio/africa.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Africa'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Africa'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Africa'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Runaway',
    '3:20',
    'English',
    'Pop',
    'https://example.com/audio/runaway.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Runaway'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Runaway'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Runaway'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Red Terror',
    '2:35',
    'English',
    'Pop',
    'https://example.com/audio/redTerror.mp3',
    '2025-01-31',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Hurry Up Tomorrow'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Red Terror'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Hurry Up Tomorrow'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Red Terror'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Hurry Up Tomorrow'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Red Terror'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Hurry Up Tomorrow'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Universal Republic'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Universal Republic'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'My Dear Melancholy',
    '2018-03-30',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'My Dear Melancholy'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Call Out My Name',
    '3:48',
    'English',
    'Alternative R&B',
    'https://example.com/audio/callOutMyName.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Call Out My Name'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Call Out My Name'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Call Out My Name'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Try Me',
    '3:41',
    'English',
    'Alternative R&B',
    'https://example.com/audio/tryMe.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Try Me'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Try Me'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Try Me'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Wasted Times',
    '3:40',
    'English',
    'Alternative R&B',
    'https://example.com/audio/wastedTimes.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Wasted Times'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Wasted Times'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Wasted Times'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'I Was Never There (feat. Gesaffelstein)',
    '4:01',
    'English',
    'Alternative R&B',
    'https://example.com/audio/iWasNeverThere.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'I Was Never There (feat. Gesaffelstein)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'I Was Never There (feat. Gesaffelstein)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'I Was Never There (feat. Gesaffelstein)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hurt You (feat. Gesaffelstein)',
    '3:50',
    'English',
    'Alternative R&B',
    'https://example.com/audio/hurtYou.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hurt You (feat. Gesaffelstein)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hurt You (feat. Gesaffelstein)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hurt You (feat. Gesaffelstein)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Privilege',
    '2:50',
    'English',
    'Alternative R&B',
    'https://example.com/audio/privilege.mp3',
    '2018-03-30',
    (SELECT album_id FROM Albums
     WHERE album_name = 'My Dear Melancholy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Privilege'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'My Dear Melancholy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Privilege'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'My Dear Melancholy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Privilege'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'My Dear Melancholy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Universal Republic'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Universal Republic'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'The Weeknd', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'The Weeknd'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Starboy',
    '2016-11-25',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Universal Republic' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Starboy'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Starboy (feat. Daft Punk)',
    '3:50',
    'English',
    'Pop',
    'https://example.com/audio/starboy.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Starboy (feat. Daft Punk)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Starboy (feat. Daft Punk)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Starboy (feat. Daft Punk)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Party Monster',
    '3:13',
    'English',
    'R&B',
    'https://example.com/audio/partyMonster.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Party Monster'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Party Monster'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Party Monster'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'False Alarm',
    '3:38',
    'English',
    'Pop',
    'https://example.com/audio/falseAlarm.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'False Alarm'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'False Alarm'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'False Alarm'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Reminder',
    '3:43',
    'English',
    'R&B',
    'https://example.com/audio/reminder.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Reminder'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Reminder'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Reminder'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Rockin'',
    '3:33',
    'English',
    'R&B',
    'https://example.com/audio/rockin.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Rockin''
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Rockin''
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Rockin''
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Secrets',
    '3:23',
    'English',
    'Pop',
    'https://example.com/audio/secrets.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Secrets'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Secrets'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Secrets'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'True Colors',
    '3:30',
    'English',
    'R&B',
    'https://example.com/audio/trueColors.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'True Colors'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'True Colors'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'True Colors'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hoodrich Pablo Juan',
    '3:44',
    'English',
    'Pop',
    'https://example.com/audio/hoodrichPabloJuan.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hoodrich Pablo Juan'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hoodrich Pablo Juan'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hoodrich Pablo Juan'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'A Lonely Night',
    '3:55',
    'English',
    'R&B',
    'https://example.com/audio/aLonelyNight.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'A Lonely Night'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'A Lonely Night'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'A Lonely Night'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Attention',
    '4:10',
    'English',
    'Pop',
    'https://example.com/audio/attention.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Attention'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Attention'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Attention'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Ordinary Life',
    '3:56',
    'English',
    'Pop',
    'https://example.com/audio/ordinaryLife.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Ordinary Life'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Ordinary Life'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Ordinary Life'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Nothing Without You',
    '3:20',
    'English',
    'Pop',
    'https://example.com/audio/nothingWithoutYou.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Nothing Without You'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Nothing Without You'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Nothing Without You'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'All I Know (feat. Future)',
    '3:33',
    'English',
    'Rap',
    'https://example.com/audio/allIKnow.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'All I Know (feat. Future)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'All I Know (feat. Future)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'All I Know (feat. Future)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Die for You',
    '4:20',
    'English',
    'R&B',
    'https://example.com/audio/dieForYou.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Die for You'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Die for You'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Die for You'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'I Feel It Coming (feat. Daft Punk)',
    '4:29',
    'English',
    'Pop',
    'https://example.com/audio/iFeelItComing.mp3',
    '2016-11-25',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Starboy'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'I Feel It Coming (feat. Daft Punk)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Starboy'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'I Feel It Coming (feat. Daft Punk)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Starboy'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'I Feel It Coming (feat. Daft Punk)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Starboy'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'The Weeknd' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Cash Money Records/Young Money Ent./Universal Rec'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'Drake', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'Drake'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Take Care',
    '2011-11-15',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Cash Money Records/Young Money Ent./Universal Rec' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Take Care'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Over My Dead Body',
    '4:43',
    'English',
    'Hip Hop',
    'https://example.com/audio/overMyDeadBody.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Over My Dead Body'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Over My Dead Body'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Over My Dead Body'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Shot for Me',
    '3:34',
    'English',
    'R&B',
    'https://example.com/audio/shotForMe.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Shot for Me'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Shot for Me'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Shot for Me'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Headlines',
    '4:00',
    'English',
    'Hip Hop',
    'https://example.com/audio/headlines.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Headlines'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Headlines'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Headlines'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Crew Love (feat. The Weeknd)',
    '5:29',
    'English',
    'R&B',
    'https://example.com/audio/crewLove.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Crew Love (feat. The Weeknd)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Crew Love (feat. The Weeknd)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Crew Love (feat. The Weeknd)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Take Care (feat. Rihanna)',
    '4:37',
    'English',
    'Hip Hop',
    'https://example.com/audio/takeCare.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Take Care (feat. Rihanna)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Take Care (feat. Rihanna)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Take Care (feat. Rihanna)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Love Yours',
    '4:29',
    'English',
    'Hip Hop',
    'https://example.com/audio/loveYours.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Love Yours'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Love Yours'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Love Yours'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Marvins Room',
    '5:45',
    'English',
    'R&B',
    'https://example.com/audio/marvinsRoom.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Marvins Room'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Marvins Room'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Marvins Room'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Under Ground Kings',
    '4:12',
    'English',
    'Hip Hop',
    'https://example.com/audio/underGroundKings.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Under Ground Kings'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Under Ground Kings'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Under Ground Kings'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'We'll Be Fine (feat. Birdman)',
    '3:39',
    'English',
    'Hip Hop',
    'https://example.com/audio/wellBeFine.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'We'll Be Fine (feat. Birdman)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'We'll Be Fine (feat. Birdman)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'We'll Be Fine (feat. Birdman)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Make Me Proud (feat. Nicki Minaj)',
    '3:49',
    'English',
    'Hip Hop',
    'https://example.com/audio/makeMeProud.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Make Me Proud (feat. Nicki Minaj)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Lord Knows (feat. Rick Ross)',
    '6:05',
    'English',
    'Hip Hop',
    'https://example.com/audio/lordKnows.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Lord Knows (feat. Rick Ross)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Lord Knows (feat. Rick Ross)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Lord Knows (feat. Rick Ross)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Cameras / Good Ones Go (Interlude)',
    '5:41',
    'English',
    'R&B',
    'https://example.com/audio/camerasGoodOnesGo.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Cameras / Good Ones Go (Interlude)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Cameras / Good Ones Go (Interlude)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Cameras / Good Ones Go (Interlude)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Doing It Wrong',
    '3:43',
    'English',
    'R&B',
    'https://example.com/audio/doingItWrong.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Doing It Wrong'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Doing It Wrong'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Doing It Wrong'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'The Ride',
    '5:10',
    'English',
    'Hip Hop',
    'https://example.com/audio/theRide.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'The Ride'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'The Ride'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'The Ride'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Look What You've Done',
    '5:23',
    'English',
    'Hip Hop',
    'https://example.com/audio/lookWhatYouveDone.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Look What You've Done'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Look What You've Done'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Look What You've Done'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)',
    '3:23',
    'English',
    'Hip Hop',
    'https://example.com/audio/hyfr.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'HYFR (Hell Ya F***ing Right) (feat. Lil Wayne)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Practice',
    '3:54',
    'English',
    'R&B',
    'https://example.com/audio/practice.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Practice'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Practice'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Practice'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'The Ride',
    '4:12',
    'English',
    'R&B',
    'https://example.com/audio/theRideAlternate.mp3',
    '2011-11-15',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Take Care'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'The Ride'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Take Care'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'The Ride'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Take Care'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'The Ride'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Take Care'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO RecordLabels (record_label_name)
SELECT 'Young Money Entertainment'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment'
);


INSERT INTO Artists (artist_name, record_label_id)
SELECT 'Drake', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = 'Drake'
);


INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    'Views',
    '2016-04-29',
    'https://example.com/Afterhours.jpg',
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = 'Young Money Entertainment' LIMIT 1),
    'Studio'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = 'Views'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Keep the Family Close',
    '6:07',
    'English',
    'Hip Hop',
    'https://example.com/audio/keepTheFamilyClose.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Keep the Family Close'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Keep the Family Close'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Keep the Family Close'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    '9',
    '3:14',
    'English',
    'Hip Hop',
    'https://example.com/audio/9.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = '9'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = '9'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = '9'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'U with Me?',
    '3:30',
    'English',
    'R&B',
    'https://example.com/audio/uWithMe.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'U with Me?'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'U with Me?'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'U with Me?'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Feel No Ways',
    '4:11',
    'English',
    'Hip Hop',
    'https://example.com/audio/feelNoWays.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Feel No Ways'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Feel No Ways'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Feel No Ways'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Hype',
    '3:25',
    'English',
    'Hip Hop',
    'https://example.com/audio/hype.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Hype'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Hype'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Hype'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Weston Road Flows',
    '4:44',
    'English',
    'Hip Hop',
    'https://example.com/audio/westonRoadFlows.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Weston Road Flows'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Weston Road Flows'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Weston Road Flows'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Redemption',
    '5:47',
    'English',
    'R&B',
    'https://example.com/audio/redemption.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Redemption'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Redemption'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Redemption'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'With You (feat. PARTYNEXTDOOR)',
    '4:03',
    'English',
    'R&B',
    'https://example.com/audio/withYou.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'With You (feat. PARTYNEXTDOOR)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'With You (feat. PARTYNEXTDOOR)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'With You (feat. PARTYNEXTDOOR)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Still Here',
    '4:32',
    'English',
    'Hip Hop',
    'https://example.com/audio/stillHere.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Still Here'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Still Here'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Still Here'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Controlla',
    '4:05',
    'English',
    'Dancehall',
    'https://example.com/audio/controlla.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Controlla'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Controlla'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Controlla'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'One Dance (feat. Wizkid & Kyla)',
    '2:54',
    'English',
    'Dancehall',
    'https://example.com/audio/oneDance.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'One Dance (feat. Wizkid & Kyla)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'One Dance (feat. Wizkid & Kyla)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'One Dance (feat. Wizkid & Kyla)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Grammys (feat. Future)',
    '3:03',
    'English',
    'Hip Hop',
    'https://example.com/audio/grammys.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Grammys (feat. Future)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Grammys (feat. Future)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Grammys (feat. Future)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Child's Play (feat. Gucci Mane)',
    '4:03',
    'English',
    'Hip Hop',
    'https://example.com/audio/childsPlay.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Child's Play (feat. Gucci Mane)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Child's Play (feat. Gucci Mane)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Child's Play (feat. Gucci Mane)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Pop Style (feat. The Throne)',
    '4:22',
    'English',
    'Hip Hop',
    'https://example.com/audio/popStyle.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Pop Style (feat. The Throne)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Pop Style (feat. The Throne)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Pop Style (feat. The Throne)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Too Good (feat. Rihanna)',
    '3:41',
    'English',
    'Dancehall',
    'https://example.com/audio/tooGood.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Too Good (feat. Rihanna)'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Too Good (feat. Rihanna)'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Too Good (feat. Rihanna)'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Summer's Over Interlude',
    '2:32',
    'English',
    'R&B',
    'https://example.com/audio/summersOver.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Summer's Over Interlude'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Summer's Over Interlude'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Summer's Over Interlude'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Fire & Desire',
    '6:09',
    'English',
    'R&B',
    'https://example.com/audio/fireAndDesire.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Fire & Desire'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Fire & Desire'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Fire & Desire'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);


INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    'Views',
    '5:01',
    'English',
    'Hip Hop',
    'https://example.com/audio/views.mp3',
    '2016-04-29',
    (SELECT album_id FROM Albums
     WHERE album_name = 'Views'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = 'Views'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = 'Views'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
          LIMIT 1
      )
);


INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = 'Views'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = 'Views'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = 'Views'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = 'Views'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = 'Drake' LIMIT 1)
);
