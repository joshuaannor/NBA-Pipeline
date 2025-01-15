import requests
import pandas as pd

response = requests.get("https://www.balldontlie.io/api/v1/games?dates[]=2025-01-13")
games = response.json()
df = pd.DataFrame(games['data'])
df.to_csv("nba_games.csv", index=False)
print("Fetched NBA data!")