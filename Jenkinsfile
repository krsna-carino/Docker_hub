pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-credits')
        IMAGE_NAME = "krsna0707/sampleapp"
    }
    stages {

        stage('Build Docker Image') {
            steps {
                sh "sudo docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "sudo docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
            }
        }

        stage('Tag as latest') {
            steps {
                sh "sudo docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${IMAGE_NAME}:latest"
                sh "sudo docker push ${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        always {
            sh "sudo docker logout"
        }
    }
}
