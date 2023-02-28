pipeline {
    agent any
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
                  sh 'docker build -t shubhamglobal/nodenana:2.0 .'
                  sh "docker login -u $USER --password-stdin"
                  sh 'docker push shubhamglobal/nodenana:2.0'
                   
               }
             }
           }
                
                        }

    }
}

