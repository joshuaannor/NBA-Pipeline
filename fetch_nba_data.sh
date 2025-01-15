#!/bin/bash
echo "Fetching NBA data..."
curl -o nba_data.json "https://www.balldontlie.io/api/v1/games?dates[]=2025-01-13"
echo "Data saved to nba_data.json"