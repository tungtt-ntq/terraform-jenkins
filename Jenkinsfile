pipeline{
    agent{
        label "node"
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