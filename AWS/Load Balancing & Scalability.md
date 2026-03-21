## Load Balancing & Scalability

- Scalability & High Availability 
    - Scalability mean that an application / system can handle greater loads by adapting
    - Two kinds of scalability 
        - Vertical
        - Horizontal (elasticity)
    - Scalability is linked but different to High Availability 

- Vertical Scalability
    - Means increasing the size of the instance
        - application is running on a t2.micro
        - scaling that application vertically means running it on a t2.large
    - Common for non distributed systems, such as a database
    - RDS, ElastiCache are services that can scale vertically
    - Usually a limit to how much you can vertically scale (hardware limit)

- Horizontal Scalability
    - Means increasing the number of instances / systems for your application
    - Implies distributed systems
    - Common for web applications / modern applications
    
- High Availability 
    - Goes hand in hand with horizontal scaling
    - Means running your applicationb / system in at least 2 data centers
    - Goal of high availability is to survive a data center loss
    - Can be passive (for RDS)
    - Can be active (for horizontal scaling)

- High Availability & Scalability **for EC2**
    - Vertical scaling
        - Increase instance size (= scale up / down)
            - From: t2.nano - 0.5G of RAM, 1 vCPU
            - TO: 12tb1.metal - 12,3 TB of RAM, 448 vCPUs
    
    - Horizontal Scaling
        - Increase number of instances (= scale out / in)
            - Auto scaling group
            - Load Balancer
    
    - High Availability
        - Run instances for the same application across mulit-AZ
            - Auto Scaling Group multi-AZ
            - Load Balancer multi-AZ

- Load Balancing
    - Load Balancers are servers that forward traffic to multiple servers (e.g EC2 instances) downstream
    - Why use a load balancer
        - Spread load across multiple downstream instances
        - Expose a single point of access (DNS) to your application
        - Seamlessly handle failures of downstream instances
        - Do regular health checks to your instances
        - Provide SSL termination (HTTPS) for your website
        - Enforce stickiness with cookies
        - High availability across zones
        - Seperate public traffic from private traffic
    - Why use an Elastic Load Balancer
        - An Elastic Load Balancer is a managed load balancer
            - AWS guarantees that it will be working
            - AWS takes care of upgrades, maintenance, high availability
            - AWS provides only a few configurations options
        - It costs less to setup your own load balancer but it will be a lot more effort on your side
        - It is integrated with many AWS offerings / services
            - EC2, EC2 Auto Scaling Groups, Amazon ECS
            - AWS Certificate Manager (ACM), Cloud Watch
            - Route 53, AWS WAF, AWS Global Accelerator
    
    - Health Checks
        - Health checks are crucial for Load Balancers
        - They enable the load balancer to know if the instances it forwards traffic to are available to reply to requests
        - The health check is done on a port and a route (/health is common)
        - If the response is not 200 (OK), then the instance is unhealthy

    - Types of Load Balancers on AWS
        - Classic Load Balancer (v1 - old generation) - 2009 - CLB
            - HTTP, HTTPS, TCP, SSL (secure TCP)
        - Application Load Balancer (v2 - new generation) - 2016 - ALB
            - HTTP, HTTPS, Websocket
        - Network Load Balancer (v2 - new generation) - 2017 - NLB
            - TCP, TLS (secure TCP), UDP
        - Gateway Load Balancer - 202 - GWLB
            - Operates at layer 3 (network layer) - IP Protocol
        - Recommended to use the newer generation load balancers as they provide more features
        - Some load balancers can be setup as internal (private) or external (public) ELBs