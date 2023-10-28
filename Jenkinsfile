pipeline {
  agent any
  stages {
    stage('bundle install') {
      steps {
        sh 'bundle install'
      }
    }
    stage('check version') {
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