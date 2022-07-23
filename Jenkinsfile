pipeline{
    agent any
    tools {
          terraform 'terraform'
    }
    parameters {
        string(name: 'apply', defaultValue: '1')
        string(name: 'delete', defaultValue: '1')
    }
    stages{
        stage("Terraform checking"){
            steps{
                when {
                    expression { return params.apply == '1'}
                }
                echo "========Start checking Terraform========"
                withCredentials([aws(credentialsId: 'aws-credentials')]) {
                    sh 'terraform --version'
                    sh '''
                        terraform init
                        terraform plan -no-color
                    '''
                    input(message: 'Apply now?', ok: 'Yes')
                    sh 'terraform apply -no-color -auto-approve'
                }
            }
        }

        stage("Terraform delete"){
            steps{
                when {
                   expression { return params.delete == '1'}
                }
                echo "========Start checking Terraform========"
                withCredentials([aws(credentialsId: 'aws-credentials')]) {
                    sh 'terraform --version'
                    sh '''
                        terraform init
                        terraform plan -no-color
                    '''
                    input(message: 'Apply now?', ok: 'Yes')
                    sh 'terraform destroy -no-color -auto-approve'
                }
            }
        }
    }
}
