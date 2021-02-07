pipeline {
    agent any
    stages {
        stage('Source') {
            steps {
                echo 'Getting the code from the Github...'
                git branch: 'master', url: 'https://github.com/AvinashK13/sensugo'
            }
        }
        stage('Build SensuGo Backend') {
            steps {
                echo 'Build the SensuGo Backend Docker Image..'
                sh  'cd $WORKSPACE'
                dir("sensugo-template_final/Backend") {
                     sh "pwd"
                     sh  "docker build -t sensugo:backend . "
                    }
            }
        }
        stage('Deploy SensuGo Backend') {
            steps {
                echo 'Build the SensuGo Backend Docker Image..'
                sh  'cd $WORKSPACE'
                dir("sensugo-template_final/Backend") {
                     sh  "docker-compose up -d "
                    }
            }
        }
        stage('Build and Deploy Influxdb') {
            steps {
                echo 'Build the Influxdb Image....' 
                 sh  'cd $WORKSPACE'
                 dir("sensugo-template_final/Influxdb") {
                     sh  "docker-compose up -d "
                 }
            }
        }
        stage('Build and Deploy Grafana') {
            steps {
                echo 'Build The Grafana Image' 
                 sh  'cd $WORKSPACE'
                 dir("sensugo-template_final/Grafana") {
                     sh  "docker-compose up -d "
                 }
            }
        }
    }
}
