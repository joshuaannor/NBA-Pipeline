pipeline {
    agent any
    environment {
        GIT_CREDENTIALS_ID = 'github-creds' // Replace with the ID you used in Jenkins credentials
    }
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
            steps {
                withCredentials([usernamePassword(credentialsId: env.GIT_CREDENTIALS_ID, passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh '''
                        git config user.name "$GIT_USERNAME"
                        git config user.email "jlocusbo3@gmail.com" // Replace with your GitHub email
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