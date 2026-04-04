## Terraform init, plan, apply, destroy

- Terraform init

    - Represents initalise 
    - First command to run in any new project

- Terraform plan

    - Previewing the changes before they are made
    - Out of running "Terraform plan" represents our *desired state*
    
    - Actions 
        - "+ create" > Resources that will be created
        - "~ update in-place" > Resources that will be modified
        - "- destory" > Resources that will be deleted

    Example:

    An EC2 instance (aws_instance.example) will be created

    A security group (aws_security_group.example) will have some properties updated

    An S3 bucket (aws_s3_bucket.example) will be destroyed

    Once the plan looks good then its time to apply!!!

- Terraform apply

    - Applies terraform to your Infrastructure
    - Generate an execution plan
    - Will then update the Terraform state file

- Terraform Destroy

    - Terraform destory comman is a way to destroy all remote objects managed by a particular Terraform configuration.

    