pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/YashinNikita/curl.git'
        ARTIFACTORY_URL = 'http://artifactory:8081/artifactory'
        ARTIFACTORY_REPO = 'todo-in-ui'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: env.REPO_URL, branch: 'master'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'make'
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    sh 'make test'
                }
            }
        }

        stage('Prepare Build Artifact') {
            steps {
                script {
                    sh 'tar czvf curl-build-artifact.tar.gz build/'  // Assuming build outputs are in the build folder
                }
            }
        }

        stage('Push to Artifactory') {
            steps {
                script {
                    def server = Artifactory.newServer url: ARTIFACTORY_URL, credentialsId: 'Your-Credentials-ID'  // Replace with your actual credentials ID
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "curl-build-artifact.tar.gz",
                                "target": "${ARTIFACTORY_REPO}/"
                            }
                        ]
                    }"""
                    server.upload(uploadSpec)
                }
            }
        }
    }

    post {
        always {
            // todo
        }
    }
}
