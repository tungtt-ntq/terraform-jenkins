pipeline{
    agent any
    tools {
          terraform 'terraform'
    }
    parameters {
        choice(
            choices: ['Apply', 'Delete'], 
            name: 'option'
        ),
    }
    stages{
        stage("Terraform checking"){
            when {
                 expression { return params.option == 'Apply'}
            }
            steps{
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
            when {
                expression { return params.option == 'Delete'}
            }
            steps{
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
