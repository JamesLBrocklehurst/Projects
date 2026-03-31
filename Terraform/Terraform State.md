## Terraform State

- Record of existing Infrastructure
- Will be the same output no matter how many times it is ran

**Desired Vs Current State**

- Desired

    - .tf
    - Things your are trying to deploy/changes you are trying to implement
    - What you are trying to achieve

- Current State

    - .tfstate
    - Up to date record of your current Infrastructure
    - What actually exists