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
        script {
            withCredentials([usernamePassword(credentialsId: 'github-creds', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                sh '''
                git checkout main
                git config user.name "joshuaannor"
                git config user.email "jlocusbo3@gmail.com"
                git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/joshuaannor/NBA-Pipeline.git
                git add index.html
                git commit -m "Add generated NBA visualization"
                git push origin main
                '''
            }
        }
    }
}