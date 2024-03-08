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
    environment{
        ENV = "${params.environment}"
        VERSION = "${params.version}"
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
                // sh '''
                //     echo $ENV
                //     cd terraform/
                //     terraform init -reconfigure  -backend-config=$ENV/backend.tf
                // '''
                sh """
                    cd terraform/
                    terraform init -reconfigure  -backend-config=${params.environment}/backend.tf
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                    cd terraform/
                    terraform plan -var-file="${params.environment}/${params.environment}.tfvars" -var "project_version=${params.version}"
                """
            }
        }
        stage('Apply'){
            steps{
                sh """
                    cd terraform/
                    terraform apply -var-file="${params.environment}/${params.environment}.tfvars" -var "project_version=${params.version}" -auto-approve
                """
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