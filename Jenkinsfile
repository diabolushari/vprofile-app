pipeline{
    agent any
    tools {
        maven 'MAVEN3.9'
    }
    environment {
        DOCKER_IMAGE = "vpro-app-image"
        CONTAINER_NAME = "vpro-container"
    }

    stages {
        stage('Fetch Code') {
            steps {
                git branch: 'main', url: 'https://github.com/diabolushari/vprofile-app.git'
            }
        }
        stage('Build') {
            steps {
                bat 'mvn install -DskipTests'
            }
        }
        stage('Unit Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        stage('Copy Artifact to Local Folder') {
            steps {
                bat 'copy target\\*.war D:\\Study\\P2\\Myartifacts\\'
            }
        }
        stage('Prepare WAR for Docker') {
            steps {
                bat 'copy target\\*.war myapp.war'
            }
        }
        stage('Clean Previous Container') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker run -d -p 9080:8080 --name %CONTAINER_NAME% %DOCKER_IMAGE%"
            }
        }
    }    
    post {
        success {
            echo "Deployment successful! App running on http://<jenkins-host>:8080"
        }
        failure {
            echo "Pipeline failed."
        }
    }  
}
