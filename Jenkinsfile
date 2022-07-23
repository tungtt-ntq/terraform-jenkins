pipeline{
    agent any
    tools {
          terraform 'terraform'
    }
    stages{
        stage("Terraform checking"){
            steps{
                echo "========Start checking Terraform========"
                withCredentials([aws(credentialsId: 'aws-credentials')]) {
                    sh 'terraform --version'
                    sh '''
                        terraform init
                        terraform plan -no-color
                    '''
                }
            }
        }
    }
}
