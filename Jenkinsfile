pipeline {
    agent {
        label 'agent1'
    }

    environment {
        REPO_URL = 'https://github.com/YashinNikita/curl.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: env.REPO_URL, branch: 'master'
            }
        }
        // TODO: Add more stages for build, test, etc.
    }
}
