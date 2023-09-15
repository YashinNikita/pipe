pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/YashinNikita/curl.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: env.REPO_URL, branch: 'master'
            }
        }
        // todo add more stages for build, test, etc.
    }
}
