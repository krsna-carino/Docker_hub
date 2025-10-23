pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('Docker-credits')
    }
    stages { 

        stage('Build docker image') {
            steps {  
                sh ' docker build -t krsna0707/sampleapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh ' docker push krsna0707/sampleapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
