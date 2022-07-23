pipeline{
    agent any
    tools {
        terraform "terraform"
    }
    stages{
        stage("Terraform checking"){
            steps{
                echo "========Start checking Terraform========"
                sh 'terraform --version'
            }
        }
    }
}
