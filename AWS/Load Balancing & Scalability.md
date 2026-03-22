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

    - Application Load Balancer
        - Application load balancers is Layer 7 (HTTP)
        - Load balancing to multiplt HTTP applications across machines (target groups)
        - Load balancing to multiple applications on the same machines (ex: containers)
        - Support for HTTP/2 and WebSocket
        - Support redirects (from HTTP to HTTPS)
        - Routing tables to different target groups
        - Routing based on path in URL 
        - Routing based on hostnmae in URL
        - Routing based on query string, Headers 
        - ALB are a great fit for micro services & container-based application (example: Docker & Amazon ECS)
        - Has a port mapping feature to redirect to a dynamic port in ECS
        - In comparison, we'd need multiple Class Load Balancer per application
    
    - Target Groups
        - EC2 instances (can be managed by an Auto Scaling Group) - HTTP
        - ECS task (managed by ECS itself) - HTTP
        - Lambda funtions - HTTP request is translated into a JSON event
        - IP Addresses - muse be private IPs
        - ALB can route to multiple target groups
        - Health checks are at the target group level

    - Network Load Balancer
        - Network load balancers (Layer 4) allow:
            - Forward TCP & UDP traffic to your instances
            - Handle millions of requests per seconds
            - Less latency - 100ms (vs 400 ms for ALB)
        - NLB has one static IP per AZ, and supports assigning Elastic IP (helpful for whitelisting specific IP)
        - NLB are used for extreme performance, TCP or UDP traffic
        - Not included in the AWS free tier
    
    - SSL/TLS
        - An SSL Certificate allows traffic between your clients and your load balancer to be encrypted in transit (in-flight encryption)

        - SSL refers to Secure Socket Layer, used to encrypt connections
        - TLS refers to Transport Layer Security, which is a newer version
        - These days, TLS certificates are mainuly used, but people still refer as SSL

        - Public SSL certificates are issued by Certificate Authorities (CA)
            - Comodo, Symantec, GoDaddy, GlobalSign, Digicert, Letsencrypt
        
        - SSL certificates have an expiration date (you set) and must be renewed

    - SSL - Server Name Indication (SNI)
        - SNI solves the problem of loading multiple SSL certificates onto one web server (to serve multiple websites)
        - It's a newer protocol, and requires the client to indicate the hostname of the target server in the initial SSL handshake
        - The server will then find the correct certificate, or return the default one

    - Elastic Load Balancers - SSL Certificates
        - Classic Load Balancer (v1)
            - Support only one SSL certificate
            - Must use multiple CLB for multiple hostname with multiple SSL certificates
        - Applciation Load Balancer (v2)
            - Supports multiple listner with multiple SSL certificates
            - Uses server name indication (SNI) to make it work
        - Network Load Balancer (v2)
            - Supports multiple listners with multiple SSL certificates
            - Uses server name indication (SNI) to make it work
    
    - Connection Draining
        - Feature Naming
            - Connection Draining - for CLB
            - Deregistraion Delay - for ALB & NLB
        - Time to complete in-flight requests while the instance is de-registering or unhealthy
        - Stops sending new request to the EC2 instance which is de-registering
        - Between 1 to 3600 seconds (default: 300 seconds)
        - Can be disabled (set value to 0)
        - Set to a low value if your requests are short

    - Auto Scaling Groups
        - In real-life the load on your website and application can change
        - In the cloud, you can create and get rid of servers very quickly

        - The goal of an Auto Scaling Group (ASG) is to:
            - Scale out (add EC2 instances) to match an increased load
            - Scale in (remove EC2 instances) to match a decreased load
            - Ensure we have a minimum number of EC2 instances running
            - Automatically register new instances to a load balancer
            - Re-create an EC2 instance in case a previous one is terminated (ex: if unhealthy)
        
        - ASG are free (you only pay for the underlying EC2 instances)

    