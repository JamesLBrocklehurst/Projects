## Variables

- Input Variables

Variable block
```Terraform

variable "image_id" {
    type = string
}
```

Above needs to be within a `variables.tf` file

Complete EC2 example of `instance_type`

```Terraform
variable "instance_type": {
    type = string
}
```

When running plan you will be prompted to input the value in this case - t2.micro

Within the "ec2.tf" file:

instance_type       = var.instance_type

Instead of 

instance_type       = "t2.micro"

Example with default value:

```Terraform
variable "instance_type": {
    type = string
    default = "t2.micro"
}
```

Best practice is to use a `terraform.tfvars` file, instead of the adding the values in the `variables.tf` file.

If you were setting the value for `instance_type`

The input in the file would be below:

```terraform
instance_type = "t2.micro"
```

### Local Variables

Allows you to simplify config by centralising values that you use consistantly 

To use this you add a locals block to your `variables.tf` file

```terraform
locals {
    instance_aim = "ami-03...."
}
```

To add to your code block:

`aim = local.instance_ami`

### Output Variables

To use this you need to use an `Output block`

This is adding to the `variables.tf` files

Example:

```Terraform
output "instance_id" {
    description = "The ID of the EC2 instance"
    value = aws_instance.this.id"
}
```
Use descriptive names 

### Variable Hierarchy

    - Input Variables (most to least)
        - Command line flags
        - TF_VAR Environment Variables
        - .tfvars files
        - Default values

### Types of Variables

- Primitive Types
    - String: some text, such as "hello"
    - Number: a numeric value. The number type can represent both whole numbers like 15 and fractional values such as 6.283185
    - Bool: either true or false. bool values can be used in conditional logic

- Complex Types
    - List: An ordered sequence of values, all of the same type. i.e list(string)
    - map: a collection of key-value pairs
    - object: a collection of attributes that can each have a different type