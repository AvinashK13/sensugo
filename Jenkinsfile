pipeline {
    agent any
    stages {
        stage('Source') {
            steps {
                echo 'Getting the code from the Github...'
                git branch: 'Docker', url: 'https://github.com/Glistensoft-Work/02-Docker.git'
            }
        }
        stage('Build SensuGo Backend') {
            steps {
                echo 'Build the SensuGo Backend Docker Image..'
                sh  'cd $WORKSPACE'
                dir("03-Docker_server/01-SensuGo-CarIQ/sensugo-template_final/Backend") {
                     sh  "docker build -t sensugo:backend . "
                    }
            }
        }
        stage('Deploy SensuGo Backend') {
            steps {
                echo 'Build the SensuGo Backend Docker Image..'
                sh  'cd $WORKSPACE'
                dir("03-Docker_server/01-SensuGo-CarIQ/sensugo-template_final/Backend") {
                     sh  "docker-compose up -d "
                    }
            }
        }
        stage('Build and Deploy Influxdb') {
            steps {
                echo 'Build the Influxdb Image....' 
                 sh  'cd $WORKSPACE'
                 dir("03-Docker_server/01-SensuGo-CarIQ/sensugo-template_final/Influxdb") {
                     sh  "docker-compose up -d "
                 }
            }
        }
        stage('Build and Deploy Grafana') {
            steps {
                echo 'Build The Grafana Image' 
                 sh  'cd $WORKSPACE'
                 dir("03-Docker_server/01-SensuGo-CarIQ/sensugo-template_final/Grafana") {
                     sh  "docker-compose up -d "
                 }
            }
        }
    }
}