# Music Streaming Web Application

A web-based music streaming application built with Flask and PostgreSQL, featuring user authentication, playlist management, and music playback capabilities.

## Features

- User registration and authentication
- Music playback with audio controls
- Create and manage playlists
- Add songs to playlists
- Modern and responsive UI
- PostgreSQL database integration

## Prerequisites

- Python 3.8 or higher
- PostgreSQL database
- pip (Python package manager)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd music_stream_app
```

2. Create a virtual environment and activate it:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install the required packages:
```bash
pip install -r requirements.txt
```

4. Create a PostgreSQL database and update the database URL in the application:
   - Create a new database named `music_stream`
   - Update the `DATABASE_URL` in the `.env` file or app configuration

5. Create a `.env` file in the project root with the following contents:
```
SECRET_KEY=your-secret-key-here
DATABASE_URL=postgresql://postgres:password@localhost:5432/music_stream
```

6. Initialize the database:
```bash
flask db init
flask db migrate
flask db upgrade
```

## Running the Application

1. Make sure your PostgreSQL server is running

2. Start the Flask application:
```bash
python app.py
```

3. Open your web browser and navigate to `http://localhost:5000`

## Usage

1. Register a new account or login with existing credentials
2. Upload music files through the admin interface
3. Create playlists and add songs to them
4. Play music directly from the web interface
5. Manage your playlists and favorite songs

## File Structure

```
music_stream_app/
├── static/
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── main.js
├── templates/
│   ├── base.html
│   ├── index.html
│   ├── login.html
│   └── register.html
├── app.py
├── requirements.txt
└── README.md
```

## Contributing

1. Fork the repository
2. Create a new branch for your feature
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 