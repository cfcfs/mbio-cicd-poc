pipeline {

  agent {
    kubernetes {
      label "build"
        defaultContainer 'build'
        yamlFile 'k8s_config.yml'
    }
  }


  stages {

    stage('Build') {

      steps {

        checkout scm

        sh '''
        git clone https://github.com/cfcfs/spring-petclinic
        mvn -B -f spring-petclinic/pom.xml clean install -DskipTests
        '''

        sh 'mvn -B -f spring-petclinic/pom.xml deploy -DskipTests'

        script {
          docker.withRegistry('', 'dockerhub') {
            sh 'docker push cortelos/petclinic:latest'
          }
        }

      }
    }

  }
}
