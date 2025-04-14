import re

def parse_input(block):
    lines = block.strip().splitlines()
    data = {
        'artist': '',
        'record_label': '',
        'album': '',
        'album_type': '',
        'release_date': '',
        'cover_url': '',
        'songs': []
    }
    song_section = False

    for line in lines:
        line = line.strip()
        if not line:
            continue
        if line.startswith("Artist:"):
            data['artist'] = line.split(":", 1)[1].strip()
        elif line.startswith("Record Label:"):
            data['record_label'] = line.split(":", 1)[1].strip()
        elif line.startswith("Album:"):
            data['album'] = line.split(":", 1)[1].strip()
        elif line.startswith("Album Type:"):
            data['album_type'] = line.split(":", 1)[1].strip()
        elif line.startswith("Release Date:"):
            data['release_date'] = line.split(":", 1)[1].strip()
        elif line.startswith("Cover URL:"):
            data['cover_url'] = line.split(":", 1)[1].strip()
        elif line.startswith("Songs:"):
            song_section = True
        elif song_section and line.startswith("-"):
            parts = [p.strip() for p in line[1:].split('|')]
            if len(parts) == 6:
                data['songs'].append({
                    'title': parts[0],
                    'duration': parts[1],
                    'language': parts[2],
                    'genre': parts[3],
                    'file_url': parts[4],
                    'release_date': parts[5]
                })
    return data

def generate_sql(data):
    sql = []

    sql.append(f"""
INSERT INTO RecordLabels (record_label_name)
SELECT '{data['record_label']}'
WHERE NOT EXISTS (
    SELECT 1 FROM RecordLabels WHERE record_label_name = '{data['record_label']}'
);
""")

    sql.append(f"""
INSERT INTO Artists (artist_name, record_label_id)
SELECT '{data['artist']}', (
    SELECT record_label_id FROM RecordLabels WHERE record_label_name = '{data['record_label']}' LIMIT 1
)
WHERE NOT EXISTS (
    SELECT 1 FROM Artists WHERE artist_name = '{data['artist']}'
);
""")

    sql.append(f"""
INSERT INTO Albums (album_name, release_date, cover_url, artist_id, record_label_id, album_type)
SELECT
    '{data['album']}',
    '{data['release_date']}',
    '{data['cover_url']}',
    (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1),
    (SELECT record_label_id FROM RecordLabels WHERE record_label_name = '{data['record_label']}' LIMIT 1),
    '{data['album_type']}'
WHERE NOT EXISTS (
    SELECT 1 FROM Albums
    WHERE album_name = '{data['album']}'
      AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
);
""")

    for song in data['songs']:
        sql.append(f"""
INSERT INTO Songs (title, duration, language, genre, file_url, release_date, album_id)
SELECT
    '{song['title']}',
    '{song['duration']}',
    '{song['language']}',
    '{song['genre']}',
    '{song['file_url']}',
    '{song['release_date']}',
    (SELECT album_id FROM Albums
     WHERE album_name = '{data['album']}'
     AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
     LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Songs
    WHERE title = '{song['title']}'
      AND album_id = (
          SELECT album_id FROM Albums
          WHERE album_name = '{data['album']}'
            AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
          LIMIT 1
      )
);
""")

        sql.append(f"""
INSERT INTO Song_Artists (song_id, artist_id)
SELECT
    (SELECT song_id FROM Songs
     WHERE title = '{song['title']}'
       AND album_id = (
           SELECT album_id FROM Albums
           WHERE album_name = '{data['album']}'
             AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
           LIMIT 1
       )
     LIMIT 1),
    (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM Song_Artists
    WHERE song_id = (
        SELECT song_id FROM Songs
        WHERE title = '{song['title']}'
          AND album_id = (
              SELECT album_id FROM Albums
              WHERE album_name = '{data['album']}'
                AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
              LIMIT 1
          )
        LIMIT 1
    )
    AND artist_id = (SELECT artist_id FROM Artists WHERE artist_name = '{data['artist']}' LIMIT 1)
);
""")
    return sql

def main():
    with open("input.txt", "r", encoding="utf-8") as file:
        content = file.read()

    blocks = re.split(r"\n\s*\n", content)
    all_sql = []

    for block in blocks:
        if block.strip():
            data = parse_input(block)
            all_sql.extend(generate_sql(data))

    with open("output.sql", "w", encoding="utf-8") as f:
        f.write("\n".join(all_sql))

    print("✅ SQL queries written to output.sql")

if __name__ == "__main__":
    main()
