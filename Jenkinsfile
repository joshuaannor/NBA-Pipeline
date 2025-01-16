pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
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
            environment {
                GIT_USERNAME = credentials('github-username')
                GIT_PASSWORD = credentials('github-password')
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-credentials-id', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    sh '''
                    git config user.name "$GIT_USERNAME"
                    git config user.email "jlocusbo3@gmail.com"
                    git pull origin main
                    git add index.html
                    git commit -m "Add generated NBA visualization"
                    git push https://$GIT_USERNAME:$GIT_PASSWORD@github.com/joshuaannor/NBA-Pipeline.git main
                    '''
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}