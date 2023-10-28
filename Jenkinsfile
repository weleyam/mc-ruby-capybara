pipeline{
    agent any
    stages{
        stage('bundle install'){
            steps{
                sh 'bundle install'
            }
        }
        stage('run automation'){
            steps{
                sh 'cucumber -t @test3'
            }
        }
    }
}