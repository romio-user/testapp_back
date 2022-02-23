pipeline {
    agent any
   
    environment {
        IMAGE_REPO_NAME="testapp_back"
        IMAGE_TAG="v_${env.BUILD_ID}"
        REPOSITORY_URI = "${env.AWS_ACCOUNT_ID}.dkr.ecr.${env.AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
        registryCredential = "test_ecs_user"
    }
   
    
    stages {
       
        stage('Git') {
            steps {
                git branch: 'main', url:'https://github.com/romio-user/testapp_back'
            }   
        }
        
        stage('Install&Test') {
            steps {
                sh 'pip3 install -r requirements.txt'
                sh 'python3 -m unittest tests/*.py'
            }
        }
        
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                }
            }
        }
        
        stage('Pushing to ECR') {
            steps{  
                script {
			        docker.withRegistry("https://" + REPOSITORY_URI, "ecr:${env.AWS_DEFAULT_REGION}:" + registryCredential) {
                    dockerImage.push()
                	}
                }
            }
        }
    }
}