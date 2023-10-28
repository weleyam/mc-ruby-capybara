pipeline{
    agent any
    stages{
        stage('bundle install'){
            steps{
                sh 'gem install bundle'
                sh 'bundle install'
            }
        }
        stage('run test'){
            steps{
                sh "cucumber -t '@test3'"
            }
        }
    }
}