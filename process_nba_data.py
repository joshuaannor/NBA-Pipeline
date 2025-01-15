import pandas as pd

df = pd.read_csv("nba_games.csv")
processed = df[['home_team.full_name', 'home_team_score', 'visitor_team.full_name', 'visitor_team_score']]
processed.columns = ['Home Team', 'Home Score', 'Away Team', 'Away Score']
processed.to_csv("processed_nba_games.csv", index=False)
print("Processed NBA data!")