## Resource Block

Used to define a piece of Infrastructure that you want to managed in your cloud provider.

Example:

``` Terraform
Resource "aws_instance" "test" {
    ami = "ami-01572eda7c4411960"
    instance_type = "t2.micro"
Tags = {
Name = "Helloworld"
}
}
```