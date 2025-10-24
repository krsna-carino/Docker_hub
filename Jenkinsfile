pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'krsna0707'   // change this
        IMAGE_NAME = 'myapp'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning repository from GitHub..."
                git branch: 'main', url: 'https://github.com/krsna-carino/Docker_hub.git'
            }
        }

        stage('Build JAR on Jenkins Host') {
            steps {
                echo "Building Maven JAR on Jenkins host..."
                sh 'mvn clean package -DskipTests'
'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image using runtime-only Dockerfile..."
                script {
                    docker.build("${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Pushing Docker image to Docker Hub..."
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-credits') {
                        docker.image("${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build completed successfully! Docker image pushed to Docker Hub."
        }
        failure {
            echo "❌ Build failed. Check the console output for details."
        }
    }
}
