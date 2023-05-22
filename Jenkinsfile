pipeline {
    agent { label 'agent' }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }

    stages {
        stage('SCM Checkout') {
            steps {
                echo 'Checkout Src from github repo'
                git 'https://github.com/grey1001/Java-mvn-app2.git'
            }
        }
        stage('Maven Build') {
            steps {
                echo 'Perform Maven Build'
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Deploy to QA Server') {
            agent { label 'qa_server' }
            steps {
                echo 'Checkout Src from github repo'
                git 'https://github.com/grey1001/Java-mvn-app2.git'
                script {
                    sh "scp -o StrictHostKeyChecking=no -r target/mvn-hello-world.war qa_server@172.31.3.151:/home/qa_server"
                }
            }
        }
    }
}
