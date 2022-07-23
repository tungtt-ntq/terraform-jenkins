pipeline{
    agent{
        label "node"
    }
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