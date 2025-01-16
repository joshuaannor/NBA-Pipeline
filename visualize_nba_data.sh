#!/bin/bash
echo "Visualizing NBA data..."

# Read processed data from JSON
data=$(cat processed_nba_data.json)

# Generate an HTML file with embedded JavaScript
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <title>NBA Data Visualization</title>
    <script>
        // Parse the data from the shell script
        const nbaData = $data;

        window.onload = function() {
            const table = document.createElement('table');
            table.border = '1';
            const headerRow = document.createElement('tr');
            headerRow.innerHTML = '<th>Team</th><th>Score</th>';
            table.appendChild(headerRow);

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
    <h1>NBA Data</h1>
</body>
</html>
EOF

echo "HTML visualization generated: index.html"