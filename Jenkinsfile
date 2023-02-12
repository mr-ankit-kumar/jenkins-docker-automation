pipeline {
    agent any
    tools{
        maven 'maven_path'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mr-ankit-kumar/jenkins-docker-automation']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh sudo chmod 666 /var/run/docker.sock
                    sh 'docker build -t ankit/devops-integration .'
                }
            }
        }
    }
}
