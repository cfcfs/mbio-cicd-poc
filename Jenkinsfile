pipeline {

  agent {
    kubernetes {
      label "build"
        defaultContainer 'build'
        yamlFile 'k8s_config.yml'
    }
  }


  stages {

    stage('Checkout') {
      steps {
        sh 'git clone https://github.com/cfcfs/spring-petclinic'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn -B -f spring-petclinic/pom.xml clean install -DskipTests'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn -B -f spring-petclinic/pom.xml verify'
      }
    }

    stage('Publish artifacts') {
      steps {
        sh 'mvn -B -f spring-petclinic/pom.xml deploy -DskipTests'
      }
    }

    stage('Publish image') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub') {
            sh 'docker push cortelos/petclinic:latest'
          }
        }
      }
    }

  }
}
