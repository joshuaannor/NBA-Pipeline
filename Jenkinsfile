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
        stage('Push to GitHub') {
            steps {
                sh '''
                    git checkout main
                    git config user.name "joshuaannor"
                    git config user.email "jlocusbo3@gmail.com"
                    git add index.html
                    git commit -m "Add generated NBA visualization"
                    git push origin main
                '''
            }
        }
    }
}