## DNS (Route 53)

- Amazon Route 53
    - A highly available, scalable, fully managed and Authoritative DNS
    - Authoritative = the customer (you) can update the DNS records
    - Route 53 is also a Domain Registrar
    - Ability to check the health of your resources
    - The only AWS service which provides 100% availability SLA
    - Why Route 53? 53 is a reference to the traditional DNS port

- Route 53 - Hosted Zones
    - A container for records that define how to route traffic to a domain and its subdomains
    - Public Hosted Zones - contains records that specify how to route traffic to the Internet (public domain names) *application.mypublicdomain.com*
    - Private Hosted Zones - contain records that specify how you route traffic within one or more VPCs (private domain names) *application1.company.internal*
    - You pay $0.50 per month per hosted zone

- What is DNS?
    - Domain Name System which translates the human friendly hostnames into the machine IP addresses
    - www.google.com => 172.217.18.36
    - DNS uses hierarchical naming structure

- DNS Terminologies
    - Domain Registrar
        - Amazon Route 53, Cloudflare, GoDaddy
    - DNS Records
        - A, AAAA, CNAME, NS
    - Zone File
        - Contains DNS records
    - Name Server
        - Resolves DNS queries (Authoritative or Non-Authoritative)
    - Top Level Domain (TLD)
        - .com, .us, .in, .gov, .org
    - Second Level Domain (SLD)
        - amazon.com, google.com, coderco.io
    
- Routes
    - Each record contains:
        - Domain/subdomain name - e.g, example.com
        - Record type - A or AAAA
        - Value - 12.34.56.78
        - Routing policy - how Route 53 responds to queries
        - TTL - amount of time the record cached at DNS Resolvers
    - Route 53 supports the following DNS record types:
        - basic A / AAAA / CNAME / NS
        - advanced CAA / DS / MX / NAPTR / PTR / SOA / TXT / SPF / SRV

- Record Types
    - A - maps a hsotname to IPv4
    - AAAA - maps a hostname to IPv6
    - CNAME - maps a hostname to another hostname
        - Target is a domain name which must have an A or AAAA record
        - Can not create a CNAME record for the top node of a DNS namespace (Zone Apex)
        - Example: you can not create for example.com, but you can create for www.example.com
    - NS - Name Servers for the Hosted Zone
        - Control how traffic is routed for a domain

- Records TTL (Time to Live) Client
    - High TTL - e.g, 24 hr
        - Less traffic on Route 53
        - Possibly outdated records
    - Low TTL - e.g, 60 sec
        - More traffic on Route 53
        - Records are outdated for less time
        - Easy to change records
    - Except for alias records, TTL is mandatory for each DNS record

- CNAME vs Alias
    - AWS Resources (Load Balancer, CloudFront) expose an AWS hostname
        - some.us-east-2.elb.amazonaws.com and you wanty myapp.mydomain.com
    - CNAME
        - Points a hostname to any other hostname
        - Only for non root domain 
    - Alias
        - Points a hostname to an AWS Resource
        - Works for root domain and non root domain
        - Free of charge
        - Native health checks

- Alias Records
    - Maps a hostname to an AWS resource
    - An extension to DNS functionality
    - Automatically recognises changes in the resource's IP addresses
    - Unlike CNAME, it can be used for the top node of a DNS namespace
    - Alias record is always of type A / AAAA for AWS resources (IPv4 / IPv6)
    - You can not set the TTL

- Alias Records - Targets
    - Elastic Load Balancers
    - CloudFront Distributions
    - API Gateway
    - Elastic Beanstalk environments
    - S3 Websites
    - VPC Interface Endpoints
    - Global Accelerator 
    - Route 53 record in the same hosted zone
    - You cannot set an ALIAS record for an EC2 DNS name

- Routing Policies - Simple
    - Typically, route traffic to a single resource
    - Can specify multiple values in the same record
    - If multiple values are returned, a random one is chosen by the client
    - When Alias is enabled, specify only one AWS resource
    - Can not be associated with Health Checks

- Routing Policies - Weighted
    - Control the % of requests that go to each specific resource
    - Assign each record a relative weight
        Weights do not need to sum up to 100
    - DNS records must have the same name and type
    - Can be associated with Health Checks
    - Use cases - load balancing between regions, testing new application versions
    - Assign a weight of 0 to a record to stop sending traffic to a resource
    - If all records have weight of 0, then all records will be returned equally

- Routing Policies - Latency Based
    - Redirect to the resource that has the least latency (closest to us)
    - Super helpful when latency for users is a priority
    - Latency is based on traffic between users and AWS Regions
    - Germany users may be directed to the US (if that is the lowest latency)
    - Can be associated with Health Checks (has a failover capability)

- Health Checks
    - HTTP Health Checks are only for public resources
    - Health Check => Automated DNS Failover
        - Health checks that monitor an endpoint (application, server, other AWS resource)
        - Health checks that monitor other other health checks (Calculated Health Checks)
        - Health checks that monitor CloudWatch Alarms (full control) - e.g - throttles of DynamoDB, alarms on RDS, custom metrics (helpful for private resources)
    - Health checks are integrated with CW metrics

- Routing Policies - Geolocation
    - Different from Latency-based
    - This routing is based on user location
    - Specify location by Continent, Country or by US State (if there is overlapping the most precise location is selected)
    - Should create a "Default" record (in case there is no match on location)
    - Use cases: website localisation, restrict content distribution, load balancing
    - Can be associated with Health Checks

- Routing Policies - Geoproximity 
    - Route traffic to your resources based on the geographic location of users resources 
    - Ability to shift more traffic to resources based on te defined bias
    - To change the size of the geographic region, specify bias values
        - To expand (1 to 99) - more traffic to the resource
        - To shrink (-1 to -99) - less traffic to the resource
    - Resources can be 
        - AWS resources (specify AWS region)
        - Non-AWS resources (specify latitude and longitude)
    - You must use Route 53 Traffic Flow

- Routing Policies - IP based Routing
    - Routing is based on clients' IP addresses
    - You provide a list of CIDRs for your clients and the corresponding endpoints/locations (user-IP-to-endpoint mappings)
    - Use cases - Optimise performance, reduce network costs
    - Example - route end users from a particular ISP to a specific endpoint

- Routing Policies - Multi Value
    - Use when routing traffic to multiple resources
    - Route 53 return multiple values/resources
    - Can be associated with Health Checks (return only values for healthy reasons)
    - Up to 8 healthly records are returned for each Multi-Value query
    - Multi-Value is not a substitute for having an ELB

- Domain Registar vs DNS Service

    - You buy or register your domain with a Domain Registrar typically by paying annual charges (e.g, GoDaddy, Amazon Registrar Inc)
    - The Domain Registrar usually provides you with a DNS service to manage your DNS records
    - You can use another DNS service to manage your records
    - Example - purchase the domain from GoDaddy and use Route 53 to manage your DNS records

    