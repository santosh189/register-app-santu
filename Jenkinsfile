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
    }

}
