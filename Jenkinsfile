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
                  sh "echo $PASS | docker login -u $USER --password-stdin"
                  sh 'docker push shubhamglobal/nodenana:2.0'
                   
               }
             }
           }
                
                        }
        
        
        /*   /// alternate way
         steps {
  script {
    echo "Building Docker image..."
    withCredentials([usernamePassword(credentialsId: 'dockerhubaccount', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
      docker.withRegistry("https://registry.hub.docker.com", "dockerhubaccount") {
        def dockerImage = docker.build("shubhamglobal/nodenana:1.0")
        dockerImage.push()
      }
    }
  }
}
        
        */

    }
}

