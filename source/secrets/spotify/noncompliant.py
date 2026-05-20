import requests
from bs4 import BeautifulSoup
import os
import spotipy
from spotipy.oauth2 import SpotifyOAuth

URL_ENDPOINTS = "https://www.billboard.com/charts/hot-100"
CLASS_DATA = "chart-element__information"

SPOTIFY_CLIENT_ID = os.environ["SPOTIFY_CLIENT_ID"]
SPOTIFY_KEY = 'gbh5f5aet8xv9tz3kud9ga5ahykjbshq'

user_choice = input("Enter in what year you want to traver following the format YYYY-MM-DD: \n")
response = requests.get(f"{URL_ENDPOINTS}/{user_choice}")
soup = BeautifulSoup(response.text, "html.parser")
musics_title = soup.find_all(name="span", class_=f"{CLASS_DATA}__song")
#  musics_artist = soup.find_all(name="span", class_=f"{CLASS_DATA}__artist")
musics_titles_list = [music.string for music in musics_title]
year = user_choice[:4]

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope="playlist-modify-private",
                                               redirect_uri="http://example.com",
                                               client_id=SPOTIFY_CLIENT_ID,
                                               client_secret=SPOTIFY_KEY,
                                               show_dialog=True,
                                               cache_path=".cache"))
user_id = sp.current_user()["id"]
songs_uri = []
for song in musics_titles_list:
    result = sp.search(q=f"track:{song} year:{year}", type="track")
    try:
        uri = result["tracks"]["items"][0]["uri"]
        songs_uri.append(uri)
    except IndexError:
        print(f"{song} is not available !")

playlist_name = f"{user_choice} Billboard 100"
playlist_id = sp.user_playlist_create(user_id, name=playlist_name, public=False)
sp.playlist_add_items(playlist_id=playlist_id["id"], items=songs_uri)