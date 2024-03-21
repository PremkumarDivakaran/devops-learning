pipeline {
    agent any

    options{
        timeout(time: 2, unit: 'SECONDS')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build steps here
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test steps here
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deployment steps here
            }
        }
    }

    post {
        always {
            script {
                def subject = "Pipeline Demo Build Number # ${currentBuild.number} - ${currentBuild.currentResult}"
                def body = "Pipeline Demo Build Number #  ${currentBuild.number} has ${currentBuild.currentResult}\n\n"
                body += "Jenkins URL: ${env.BUILD_URL}"
                sendEmail(subject, body)
            }
        }
    }
}

def sendEmail(String subject, String body) {
    mail to: 'dprem1006@gmail.com',
         subject: subject,
         body: body
}
