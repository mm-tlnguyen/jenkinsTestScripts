pipeline {
    agent any
    stages {

        stage ("Checkout SCM and test tools") {
           steps {
              checkout scm
                echo 'Checkout scm'
           }
        }
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Unit Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'development' || env.BRANCH_NAME == 'qa' || env.BRANCH_NAME == 'uat' || env.BRANCH_NAME == 'master') {
                        def serverIp = getServerIp(env.BRANCH_NAME)
                        def serverName = getServerName(env.BRANCH_NAME)
                        echo "Deploying to " + serverName + " - " + serverIp
                        sh("bash ./scripts/jenkins/deploy.sh ${serverIp} ${serverName}")
                    } else {
                        echo 'This is a feature branch, will not be deployed to environment'
                    }
                }
            }
       }
    }
    post {
        always {
            echo 'Done maybe'
        }
    }
}

def getServerIp(String branch) {
    if (branch == 'development') {
        return '1.2.3.4'
    } else if (branch == 'qa') {
        return '5.6.7.8'
    } else if (branch == 'master') {
        return '9.10.11.12'
    }
}

def getServerName(String branch) {
    if (branch == 'development') {
        return 'dev'
    } else if (branch == 'qa') {
        return 'qa'
    } else if (branch == 'master') {
        return 'uat'
    }
}
