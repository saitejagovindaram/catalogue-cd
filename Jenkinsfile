pipeline{
    agent {
        node {
            label 'agent-1'
        }
    }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'what is the version?')
        string(name: 'environment', defaultValue: '', description: 'what is the environment?')
    }
    stages{
        stage('Print Version and Environment'){
            steps{
                /*sh '''
                    echo "Version is: ${params.version}" // this will not work because it is goovy expression, so assign it to env variable and refer it in shell script
                '''   */
                echo "Version is: ${params.version}"
                echo "Environment is: ${params.environment}"
            }
        }
        stage('Init'){
            steps{
                sh '''
                    cd terraform/
                    terraform init -reconfigure
                '''
            }
        }
    }

    post {
        always{
            echo 'I will run always'
            deleteDir()
        }
    }


}