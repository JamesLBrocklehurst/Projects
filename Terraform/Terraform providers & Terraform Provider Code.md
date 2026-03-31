## Terraform Providers & Terraform Provider Code

- Terraform Providers

    - Plugin that allows you to interact with the cloud

- Terraform Provider code

```Terraform

Terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.62.0"
        }
    }
}

Provider "aws" {
    #Configuration options
}
```

You would paste the above code into your Terraform configuration. Then run, terraform init.