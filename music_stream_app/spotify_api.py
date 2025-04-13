import os
import base64
import requests
from dotenv import load_dotenv
import time

load_dotenv()

class SpotifyAPI:
    def __init__(self):
        self.client_id = os.getenv('SPOTIFY_CLIENT_ID')
        self.client_secret = os.getenv('SPOTIFY_CLIENT_SECRET')
        self.token = None
        self.token_expires = 0

    def get_token(self):
        if self.token and self.token_expires > time.time():
            return self.token

        auth_string = f"{self.client_id}:{self.client_secret}"
        auth_bytes = auth_string.encode("utf-8")
        auth_base64 = str(base64.b64encode(auth_bytes), "utf-8")

        url = "https://accounts.spotify.com/api/token"
        headers = {
            "Authorization": f"Basic {auth_base64}",
            "Content-Type": "application/x-www-form-urlencoded"
        }
        data = {"grant_type": "client_credentials"}
        
        result = requests.post(url, headers=headers, data=data)
        json_result = result.json()
        self.token = json_result["access_token"]
        self.token_expires = time.time() + json_result["expires_in"]
        return self.token

    def search_track(self, track_name, artist_name):
        token = self.get_token()
        headers = {"Authorization": f"Bearer {token}"}
        
        # Construct search query
        query = f"track:{track_name} artist:{artist_name}"
        url = f"https://api.spotify.com/v1/search?q={query}&type=track&limit=1"
        
        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()
            data = response.json()
            
            if data['tracks']['items']:
                track = data['tracks']['items'][0]
                return {
                    'cover_url': track['album']['images'][0]['url']
                }
            return None
        except requests.exceptions.RequestException as e:
            print(f"Error searching Spotify: {e}")
            return None

# Create a global instance
spotify_api = SpotifyAPI() 