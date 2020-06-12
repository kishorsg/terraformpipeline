node {

 stage ('Terraform Init') {
      print "Init Provider" 
      sh "terraform init"
    }


    stage ('Terraform Validate') {
      print "Validating The TF Files"
      sh "terraform validate"
    }
    
    stage ('Terraform Plan') {
      withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'), 
                       string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh "terraform plan -out=create.tfplan"
         
                       }  
    }

    // wait for approval. If Plan checks out.
    input 'Deploy stack?'
    
    stage ('Terraform Apply') {
      withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'), 
                       string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh "terraform apply create.tfplan"
       }  
    }
}
