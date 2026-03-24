## Serverless

- Serverless is a new paradigm in which the developers do not have to managed servers anymore
- You just need to deploy code, functions etc

- Serverless in AWS
    - AWS Lambda
    - DynamoDB
    - AWS Cognito
    - AWS API Gateway
    - Amazon S3
    - AWS SNS & SQS
    - AWS Kinesis Data Firehose
    - Aurora Serverless
    - Step Functions
    - Fargate

- Why Lambda
    - Virtual functions - no servers to manage
    - Limited by times - Short executions
    - Run on-demand
    - Scaling is automated

- Benefits of AWS Lambda
    - Easy Pricing
        - Pay per request and compute time
        - Free tier of 1,000,000 AWS Lambda request and 400,000 Gbs of compute times
    - Integrated with the whole AWS suite of services
    - Integrated with many programming languages 
    - Easy monitoring through AWS CloudWatch
    - Easy to get more resources per functions (up to 10GB of RAM)
    - Increasing RAM will also improve CPU and network

- AWS Lambda Language Support
    - Node.js (JavaScript)
    - Python
    - Java
    - C# (.net Core)/Powershell
    - Ruby
    - Custom Runtime API (community supported, example Rust or Golang)
    - Lambda Container Image
        - The container image must implement the Lambda Runtime API
        - ECS/Fargate is prefered for running arbitrary Docker images

