pipeline {
    agent {
        label 'agent'
    }
    
    tools {
        maven 'mymaven'
        dockerTool 'mydocker' // Name of the Docker installation configured in Jenkins
    }
    
    stages {
        stage('Login to Docker Hub') {
            agent {
                label 'agent'
            }
            
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-login', url: 'https://registry.hub.docker.com']) {
                        sh 'docker login -u <username> -p <password>'
                    }
                }
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            agent {
                label 'agent'
            }
            
            steps {
                script {
                    def imageName = 'greyabiwon/java-mvn-app:latest'
                    
                    docker.build(imageName, '-f Dockerfile .')
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-login') {
                        docker.image(imageName).push()
                    }
                }
            }
        }
        
        stage('Deploy to Container') {
            agent {
                label 'agent'
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
