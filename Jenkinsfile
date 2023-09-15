pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/curl/curl.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: env.REPO_URL, branch: 'master'
            }
        }
    }
}
