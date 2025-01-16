#!/bin/bash
echo "Visualizing NBA data..."

# Check if processed data file exists
if [[ ! -f processed_nba_data.json ]]; then
    echo "Error: processed_nba_data.json not found!"
    exit 1
fi

# Read processed data from JSON file and escape it for JavaScript
data=$(cat processed_nba_data.json | jq -c '.')

# Generate an HTML file with embedded JavaScript
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <title>NBA Data Visualization</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        // Parse the JSON data
        const nbaData = $data;

        window.onload = function() {
            const table = document.createElement('table');
            table.border = '1';

            // Create header row
            const headerRow = document.createElement('tr');
            headerRow.innerHTML = '<th>Team</th><th>Score</th>';
            table.appendChild(headerRow);

            // Populate table rows with data
            nbaData.forEach(row => {
                const dataRow = document.createElement('tr');
                dataRow.innerHTML = '<td>' + row.team + '</td><td>' + row.score + '</td>';
                table.appendChild(dataRow);
            });

            document.body.appendChild(table);
        };
    </script>
</head>
<body>
    <h1 style="text-align:center;">NBA Data Visualization</h1>
</body>
</html>
EOF

echo "HTML visualization generated: index.html"