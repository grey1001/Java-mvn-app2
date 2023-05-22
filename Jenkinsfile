pipeline {
    agent {
        label 'agent'
    }
    
    tools {
        maven 'mymaven'
        dockerTool 'mydocker' // Name of the Docker installation configured in Jenkins
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
         
        stage('Build Docker Image') {
            agent {
                label 'qa_server'
            }
            
            steps {
                script {
                    def imageName = 'greyabiwon/java-mvn-app:latest'
                    
                    docker.build(imageName, '-f Dockerfile .')
                    docker.withRegistry('https://registry.hub.docker.com', '32b88c11-19dc-42d7-890c-05a4d8d3f1b5') {
                        docker.image(imageName).push()
                    }
                }
            }
        }
        
        stage('Deploy to Container') {
            agent {
                label 'qa_server'
            }
            
            steps {
                script {
                    def containerName = 'java-web-app'
                    def imageName = 'greyabiwon/java-web-app:latest'
                    
                    sh "docker pull $imageName"
                    sh "docker stop $containerName || true"
                    sh "docker rm $containerName || true"
                    sh "docker run -d -p 8383:8080 --name $containerName $imageName"
                }
            }
        }
    }
}
