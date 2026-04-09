## Terraform Workflow

- init
    - Used to initialise a working directory containing config files
    - This is the first command that should be run after writing a new Terraform configuration
    - Downloads Providers

- validate
    - Validated the terraform configuration files in that responsive directory to ensure they are syntactically valid and internally consistent

- plan
    - Creates an execution plan
    - Terraform performs a refresh and determines what actions are necessary to achieve the desired state specified in configuration files

- apply
    - Used to apply to changes required to reach the desired state of the configuration
    - By default, apply scans the current directory for the configuration and applies the changes appropriately

- destroy
    - Used to destroy the Terraform managed Infrastructure 
    - This will ask for confirmation before destroying