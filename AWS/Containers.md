## Containers

**Docker**

- Docker is a software development platform to deploy apps
- Apps are packaged in containers that can be run on any OS
- Apps run the same, regardless of where they're run
    - Any machine
    - No compatibility issues
    - Predictable behaviour
    - Less work
    - Easier to maintain and deploy
    - Works with any language, any OS, any technology
- Use cases: microservices architecture, lift-and-shift apps from on-premise to the AWS cloud

- Docker images are stored in Docker Repositories
- Docker Hub (https://hub.docker.com)
    - Public repository
    - Find base images for many technologies or OS (e.g. Ubuntu, MySQL)
- Amazon ECR (Amazon Elastic Container Registry)
    - Private repository
    - Public repository (Amazon ECR Public Gallery https://gallery.ecr.aws)


- Docker vs Virtual Machines
    - Docker is "sort of" a virtualisation technology, but not exactly
    - Resources are shared with the host => many contrainers on one server 

        - VM
            - Hypervisor
            - Host OS
            - Infrastructure
        
        - Docker
            - Docker Daemon
            - Host OS (EC2 Instance)
            - Infrastructure
    
- Container-related Services on AWS
    - Amazon Elastic Container Service (Amazon ECS)
        - Amazons own container platform
    - Amazon Elastic Kubernetes Service (Amazon EKS)
        - Amazons managed Kubernetes (open source)
    - AWS Fargate
        - Amazons own serverless container platform
        - Works with ECS and with EKS
    - Amazon ECR
        - Store container images

- Amazon ECS - EC2 Launch Type
    - Launch Docker containers on AWS = Launch ECS tasks on ECS clusters
    - EC2 Launch type: you must provision & maintain the infrastructure (the EC2 instance)
    - Each EC2 instance must run the ECS agent to register in the ECS Cluster
    - AWS takes care of starting / stopping containers

- Amazon ECS - Fargate Launch Type
    - Launch Docker Containers on AWS
    - You do not provision the infrastructure (no EC@ instances to manage)
    - It is all serverless
    - You can just create task definitions
    - AWS just runs ECS tasks for you based on the CPU / RAM you need
    - To scale, just increase the number of tasks - no more EC2 instances

- Amazon ECS - IAM Roles for ECS
    - EC2 instance profile (EC2 Launch type only)
        - Used by the ECS agent
        - Makes API calls to ECS service
        - Send container logs to CloudWatch Logs
        - Pull Docker image from ECR
        - Reference sensitive data in Secrets
        - Manager or SSM Parameter Store
    - ECS Task Role
        - Allows each task to have a specific role
        - Use different roles for the different ECS services you run
        - Task role is defined in the task definition

- Amazon ECS - Load Balancer Integrations
    - Application Load Balancer supported and works for most use cases
    - Network Load Balancer recommended only for high throughput / high performance use cases, or to pair it with AWS Private Link
    - Classic Load Balancer supported but not recommended (no advanced features - no Fargate)

- ECS Service Auto Scaling
    - Automatically increase/decrease the desired number of ECS tasks
    - Amazon ECS Auto Scaling uses AWS Application Auto Scaling
        - ECS Service Average CPU Utilisation
        - ECS Service AVerage Memory Utilisation - Scale on RAM
        - ALB Request Count Per Target - metric coming from the ALB
    - Target Tracking - Scaled based on target value for specific CloudWatch metric
    - Step Scaling - Scaled based on a specified CloudWatch Alarm
    - Scheduled Scaling - Scaled based on a specified date/time (predictable changes)
    - ECS Service Auto Scaling (task level) = EC2 Auto Scaling (EC2 instance level)
    - Fargate Auto Scaling is much easier to setup (becuase it is serverless)

- Amazon ECR
    - ECR = Elastic Container Registry
    - Store and manage Docker images in AWS
    - Private and Public repository
    - Fully integrated with ECS, backed by Amazon S3
    - Access in controlled through IAM
    - Support image vulnerability scanning, versioning, image tags, image Lifecycle

- Amazon EKS
    - Amazon EKS = Amazon Elastic Kubernetes Service
    - It is a way to launch managed Kubernetes clusters on AWS
    - Kubernetes is an open-source system for automatic deployment, sclaing and management of containerised (usually Docker) applications
    - It is an alternative to ECS, Similar goal but different API
    - EKS supports EC2 if you want to deploy worker nodes or Fargate to deploy serverless containers
    - Use case: Your company is already using Kunernetes on-prem or in another cloud and wants to migrate to AWS using Kubernetes
    - Kubernetes is cloud-agnostic (can be used in any cloud, Azure, GCP, AWS)
    - For multiple regions, deploy on EKS cluster per region
    - Collect logs and metrics using CloudWatch Container Insights

- Amazon EKS - Node Types
    - Managed Node Groups
        - Creates and manages nodes (EC2 instances) for you
        - Nodes are part of an ASG managed by EKS
        - Supports On-Demand or Spot instances
    - Self-Managed Nodes
        - Nodes created by you and registered to the EKS cluser and managed by an ASG
        - You can use prebuilt AMI - Amazon EKS optimised AMI
        - Supports On-Demand or Spot Instances
    - AWS Fargate
        - No maintenance required, no nodes managed

