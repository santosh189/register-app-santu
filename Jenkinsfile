pipeline {
    agent { label 'jenkinsagent' }

    tools {
      jdk 'Java21'
      maven 'Maven3'
    }

    environment {
        IMAGE_NAME="harisantosh/registration-app-santu"
        DOCKER_USER="harisantosh"
    }

    stages {
        stage ('cleanup workspce') {
            steps {
                cleanWs()
            }
        }
     
        stage ('checkout from scm') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/santosh189/register-app-santu.git'
            }
        }

        stage ('build the application') {
            steps {
                sh "mvn clean package"
            }
        }

        stage ('test the application') {
            steps {
                sh "mvn test"
            }
        }

        stage ('build and push the image') {
            steps {
                script {
                    def IMAGE_TAG = "build-${env.BUILD_NUMBER}"
                    env.IMAGE_TAG = IMAGE_TAG
                    
                    withCredentials([usernamePassword(
                        credentialsId: 'docker-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {

                        sh """
                            echo "$PWD"
                            docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                            echo "\$DOCKER_PASS" | docker login -u "\$DOCKER_USER" --password-stdin
                            docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        """
                    }
                }
            }
        }
        
    }

}
