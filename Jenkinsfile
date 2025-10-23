pipeline {
    agent any 

    environment {
        // Pull Docker Hub credentials
        DOCKERHUB_CREDENTIALS_USR = credentials('Docker-credits_USR')
        DOCKERHUB_CREDENTIALS_PSW = credentials('Docker-credits_PSW')
        IMAGE_NAME = 'krsna0707/sampleapp'
    }

    stages { 
        stage('Build docker image') {
            steps {  
                echo '🐳 Building Docker image...'
                sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
            }
        }

        stage('Login to Docker Hub') {
            steps{
                echo '🔑 Logging in to Docker Hub...'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps{
                echo '🚀 Pushing image to Docker Hub...'
                sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            echo '🧹 Logging out of Docker Hub...'
            sh 'docker logout'
        }
    }
}
