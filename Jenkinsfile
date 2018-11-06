podTemplate(label: 'mbio-cicd-poc',
  containers: [
    containerTemplate(
      name: 'jnlp',
      image: 'jenkinsci/jnlp-slave:3.10-1-alpine',
      args: '${computer.jnlpmac} ${computer.name}'
    ),
    containerTemplate(
      name: 'build',
      image: 'mbcicdpoc/build',
      command: 'cat',
      ttyEnabled: true
    ),
  ]
)
{
  node ('mbio-cicd-poc') {

    agent any
    
    stages {
        stage('Build') {
            container('build') {
                echo 'building image...'
                sh """
                mvn --version
                """
            }
        }

        stage('Push Docker HUB') {
            container('build') {
                echo 'push docker image to docker hub...'
            }
        }
    }
  }
}
