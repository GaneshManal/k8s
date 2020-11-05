pipeline {
  agent any
  options { timestamps () }
  environment {
    JENKINS_OCI='http://127.0.0.1:9002'
  }
  stages {

    stage ('build-app') {
      when {
        environment name: 'BUILD', value: 'true'
      }
      steps {
        build job: 'bg-build-app-docker-image', parameters: [
          string(name: 'VERSION', value: "${env.VERSION}")
        ]
      }
    }

    stage ('deploy-app') {
      when {
        environment name: 'DEPLOY', value: 'true'
      }
      steps {
        build job: 'bg-deploy-app-pods', parameters: [
          string(name: 'VERSION', value: "${env.VERSION}")
        ]
      }
    }

    stage ('test-app') {
      when {
        environment name: 'TEST', value: 'true'
      }
      steps {
        build job: 'bg-run-test-plan', parameters: [
          string(name: 'VERSION', value: "${env.VERSION}")
        ]
      }
    }

    stage ('upgrade-version') {
      when {
        environment name: 'UPGRADE', value: 'true'
      }
      steps {
        build job: 'bg-update-version', parameters: [
          string(name: 'VERSION', value: "${env.VERSION}")
        ]
      }
    }

  }
}
