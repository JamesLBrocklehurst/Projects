## Storage

- EBS Volume

    - EBS (Elastic Block Store) volume is a network drive you can attach to your instacnes while they run
    - It allows your instances to persist data, even after their termination
    - They are bound t a specific AZ
    - Analogy: Think of them as a "network USB stick"
    - Free Tier: 30GB of free EBS storage of General purpose (SSD) or Magnetic per month

- AMI (Amazon Machine Image)

    - AMI are a customisation of an EC2 instance
        - You add your own software, configuration, operating system, monitoring
        - Faster boot / configuration time becuase all your software is pre-packaged
    
    - AMI are built for a region (and can be copied across regions)

    - You can launch EC2 instances from:
        - A public AMI: AWS Provided
        - Your own AMI: you make and maintain them yourself
        - An AWS Marketplace AMI: an AMI someone else made (and potentially sells)

- Amazon EFS - Elastic File System

    - Managed NFS (network file system) that can be mounted on many EC2
    - EFS works with EC2 instances in multi - AZ
    - Highly available, scalable, Expensive around 3x gp2, pay per use