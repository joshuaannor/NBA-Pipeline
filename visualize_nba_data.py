import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("processed_nba_games.csv")
plt.bar(data['Home Team'], data['Home Score'], label='Home Score')
plt.bar(data['Away Team'], data['Away Score'], label='Away Score', alpha=0.7)
plt.xticks(rotation=45)
plt.ylabel('Scores')
plt.title('NBA Game Scores')
plt.legend()
plt.savefig("nba_scores_chart.png")
print("Visualization saved!")