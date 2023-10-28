pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh 'ruby --version'
      }
    }
    stage('run test') {
      steps {
        sh 'bundle exec rake cucumber:run_1'
      }
    }
  }
}