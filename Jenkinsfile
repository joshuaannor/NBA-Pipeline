pipeline {
    agent any
    stages {
        stage('Fetch Data') {
            steps {
                sh './fetch_nba_data.sh'
            }
        }
        stage('Process Data') {
            steps {
                sh './process_nba_data.sh'
            }
        }
        stage('Visualize Data') {
            steps {
                sh './visualize_nba_data.sh'
            }
        }
    }
}