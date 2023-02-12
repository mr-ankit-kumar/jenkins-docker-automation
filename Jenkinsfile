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
                    sh 'docker build -t ankit/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   sh 'docker login -u ankitr985 -p Ankit@1996 docker.io'
                   sh 'docker push ankit/devops-integration'
     
               }
            }
       }
    }
}
