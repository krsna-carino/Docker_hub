pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-credits')
    }
    stages {

        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t krsna0707/sampleapp:$BUILD_NUMBER .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'sudo docker push krsna0707/sampleapp:$BUILD_NUMBER'
            }
        }
    }
    post {
        always {
            sh 'sudo docker logout'
        }
    }
}
:
