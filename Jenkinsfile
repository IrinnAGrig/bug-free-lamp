pipeline{
    agent { label 'linux'}
    options {
        buildDiscarger(logRotator(numToKeepStr: '5'))
    }
    environment {
        DOCHERHUB_CREDENTIALS = credentials('irinagrig-dockerhub')
    }
    stages{
        stage('Build'){
            steps{
                sh 'docher build -t irinagrig/react-project1 .'
            }
        }
        stage('Login'){
            sh 'echo $DOCHERHUB_CREDENTIALS_PSW | docker login -u  $DOCHERHUB_CREDENTIALS_USR --password-stdin'
        }
        stage('Push'){
            steps {
                sh 'docker push irinagrig/react-project1:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
    
}