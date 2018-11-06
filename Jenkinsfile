podTemplate(label: 'mbio-cicd-poc',
  containers: [
    containerTemplate(
      name: 'jnlp',
      image: 'jenkinsci/jnlp-slave:3.10-1-alpine',
      args: '${computer.jnlpmac} ${computer.name}'
    ),
    containerTemplate(
      name: 'build',
      image: 'mbcicdpoc/build:0.2',
      command: 'cat',
      ttyEnabled: true
    ),
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]
)
{
  node ('mbio-cicd-poc') {

    stage('Build') {
        container('build') {
            echo 'building image...'
            sh """
            git clone https://github.com/cfcfs/spring-petclinic 
            cd spring-petclinic 
            mvn clean install 
            """
        }
    }

    stage('Push Docker HUB') {
        container('build') {
            echo 'push docker image to docker hub...'
            sh """
            docker version
            """
        }
    }

  }
}
