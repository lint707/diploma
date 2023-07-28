pipeline {
    agent any
    stages {
        stage('git') {
            steps {
                git branch: 'main', credentialsId: '184c62f7-d13e-4780-ac9d-df6a38b89594', url: 'https://github.com/lint707/nginx_diploma.git'
            }
        }
        stage('docker1') {
            steps {
                sh 'sudo docker build . -t lint707/nginx_diploma:3.19.$BUILD_NUMBER'
            }
        }
        stage('docke2') {
            steps {
                sh 'sudo docker push lint707/nginx_diploma:3.19.$BUILD_NUMBER'
            }
        }
        stage('push1') {
            steps {
                sh 'helm upgrade nginx /home/jenkins/diploma/helm/nginx_diploma --set image="lint707/nginx_diploma:3.19.$BUILD_NUMBER"'
            }
        }        
    }
}
