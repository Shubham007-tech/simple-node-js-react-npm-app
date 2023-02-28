pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
     environment {
            CI = 'true'
        }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('build & push docker') {
                    
            steps{
           script{
               echo "building docker image..."
               withCredentials([usernamePassword(credentialsId:'dockerhubaccount' , passwordVariable:'PASS' , usernameVariable:'USER')]){
                  sh 'docker build -t shubhamglobal/nodenana:1.0 .'
                  sh "echo $PASS | docker login -u $USER --password-stdin"
                  sh 'docker push shubhamglobal/nodenana:1.0'
                   
               }
             }
           }
                
                        }

    }
}

