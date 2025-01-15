#!/bin/bash
echo "Processing NBA data..."
# For example, extract team names using `jq` (a lightweight JSON processor)
jq '.data[] | {home_team: .home_team.full_name, home_score: .home_team_score, away_team: .visitor_team.full_name, away_score: .visitor_team_score}' nba_data.json > processed_nba_data.json
echo "Processed data saved to processed_nba_data.json"