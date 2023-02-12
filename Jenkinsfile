pipeline {
    agent any
    tools{
        maven 'maven_3_9_0'
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
                   withCredentials([string(credentialsId: 'docerhubpwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u ankitr985 -p {dockerhubpwd}'
                  }
                   sh 'docker push ankit/devops-integration'
     
               }
            }
       }
    }

}
