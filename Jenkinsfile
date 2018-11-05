pipeline {
    agent {
        docker {
          image 'docker:latest'
          args '--privileged'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo 'building image...'
            }
        }

        stage('Push Docker HUB') {
            steps {
                echo 'push docker image to docker hub...'
            }
        }
    }
}
