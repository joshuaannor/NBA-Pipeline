pipeline {
    agent any
    stages {
        stage('Fetch Data') {
            steps {
                sh 'python fetch_nba_data.py'
            }
        }
        stage('Process Data') {
            steps {
                sh 'python process_nba_data.py'
            }
        }
        stage('Visualize Data') {
            steps {
                sh 'python visualize_nba_data.py'
            }
        }
    }
}
