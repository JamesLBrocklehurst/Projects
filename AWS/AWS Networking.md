## AWS Networking

- Understanding CIDR - IPv4
    - Classless Inter-Domain Routing - a method for allocating IP addresses
    - Used in Secuirty Group rules and AWS networking in general
    - They help to define an IP address range:
        - WW.XX.YY.ZZ/32 = one IP
        - 0.0.0.0/0 = all IPs
        - 192.168.0.0/26 = 192.168.0.0 - 192.168.0.63 (64 IP addresses)
    - CIDR consists of two components 
    - Base IP
        - Represents an IP contained in the range
        - Example: 10.0.0.0, 192.168.0.0
    - Subnet Mask
        - Defines how many bits can change in the IP
        - Example: /0, /24, /32
        - Can take two forms:
            - /8 255.0.0.0
            - /16 255.255.0.0
            - /24 255.255.255.0
            - /32 255.255.255.255
    
- Public vs Private IP (IPv4)
    - The Internet Assigned Numbers Authority (IANA) established certain blocks of IPv4 addresses for the use of Private (LAN) and public (Internet) addresses
    - Private IP can only allow certain values:
        - 10.0.0.0 - 10.255.255.255 (10.0.0.0/8) for big networks
        - 172.16.0.0 - 172.31.255.255 (172.16.0.0/12) AWS default VPC in that range
        - 192.168.0.0 - 192.168.255.255 (192.168.0.0/16) likely home networks
    - All the rest of the IP addresses on the Internet are Public
    
    - VPC (Virtual Private Cloud)
        - All new AWS accounts have a default VPC
        - New EC2 instances are launched into the default VPN if no subnet is specified
        - Default VPC has Interent connectivity and all EC2 instances inside it have public IPv4 addresses
        - We also get a public and a private IPv4 DNS names

    - VPC - Subnets (IPv4)
        - AWS reserves 5 IP addresses (first 4 & last 1) in each subnet
        - These 5 IP addresses are not availble for use and can not be assigned to an EC2 instance
    
    - Internet Gateway (IGW)
        - Allows resources in a VPC to connect to the Internet
        - It scales horizontally and is highly available and redudant
        - Must be created sperately from a VPC
        - One VPC can only be attached to one IGW and vice versa
        - Internet Gateways on their own do not allow Internet access
        - Route tables must also be updated

    - Bastion Hosts
        - We can use a Bastion Host to SSH into our private EC2 instances
        - The bastion is in the public subnet which is then connected to all other private subnets
        - Bastion host security group must allow inbound from the internet on port 22 from restricted CIDR, for example the public CIDR of your corporation
        - Security Group of the EC2 Instances must allow the Security Group of the Bastion Host, or the private IP of the Bastion Host

    - NAT Gateway
        - Allow instances in a private subnet to connect to the internet whilst blocking incoming traffic from the internet
        - AWS-managed NAT, higher bandwidth, high availability, no administration
        - Pay per hour for usage and bandwidth
        - NATGW is created in a specific Availability Zone, uses an Elastic IP
        - Can not be used by EC2 instance in the same subnet (only from other subnets)
        - Requires an IGW (Private subnet => NATGW => IGW)
        - 5 Gbps of bandwidth with automatic scaling up to 100 Gbps
        - No Security Groups to manage / required
        - Should create at least 2 NATGW in at least 2 AZ's for redundancy

    - NAT Gateway vs NAT Instance

    || NAT Gateway | NAT Instance |
    |:--|:--|:--|
    |Availability|Highly available within AZ (create in another AZ)|Use a script to manage failover between instances|
    |Bandwidth|Up to 100 Gbps|Depends on EC2 instance type|
    |Maintenance|Managed by AWS|Managed by you|
    |Cost|Per hour & amount of data transferred|Per hour, EC2 instance type and size, + network|
    |Public IPv4|Yes|Yes|
    |Private IPv4|Yes|Yes|
    |Security Groups|No|Yes|
    |Use as Bastion Host|No|Yes|

    - Network Access Control List (NACL)
        - NACL are like a firewall which control traffic from and to subnets
        - One NACL per subnet, new subnets are assigned the Default NACL
        - You define NACL Rules:
            - Rules have a number (1-32766), higher precedence with a lower number
            - First rule match will drive the decision
            - The last rule is an aterisk (*) and denies a request in case of no rule match
            - AWS recommends adding rules by increment of 100
        - Newly created NACLs will deny everything
        - NACL are a great way of blocking a specific IP address at the subnet level

    - Security Groups & NACLs
        - Security Group 
            - Instance level
        - NACLs 
            - Subnet level

    - VPC Peering
        - Privately connect two VPCs using AWS' network
        - Make them behave as if they were in the same network
        - Must not have overlapping CIDRs
        - VPC Peering connection is NOT transitive (must be established for each VPC that need to communicate with one another)
        - You must update route tables in each VPC's subnets to ensure EC2 instances can communicate with each other

    - VPC Peering - Good to know
        - You can create VPC Peering connection between VPCs in different AWS accounts/regions
        - You can refernce a security group in a peered VPC (works croos accounts - same region)

    - VPC Endpoints (AWS PrivateLink)
        - Every AWS service is publicly exposed (public URL)
        - VPC Endpoints (powered by AWS services using a private network instead of using the public Internet)
        - They're redundant and scale horizontally 
        - They remove the need of IGW, NATGW, to access AWS Services
        - In case of issues:
            - Check DNS Settings Resolution in your VPC
            - Check Route Tables
        
    - Types of Endpoints
        - Interface Endpoints (powered by PrivateLink)
            - Provisions an ENI (private IP address) as an entry point (must attach a security group)
            - Supports most AWS services
            - $ per hour + $ per GB of data processed
        - Gateway Endpoints
            - Provisions a gateway and must be used as a target in a route table (does not use security groups)
            - Supports both S3 and DynamoDB
            - Free

    - IPv6 in VPC
        - IPv4 cannot be disabled for your VPC and subnets
        - You can enable IPv6 (they're public IP addresses) to operate in dual-stack mode
        - Your EC2 instances will get at least a private internal IPv4 and a public IPv6
        - They can communicate using either IPv4 or IPv6 to the internet through an Internet Gateway

    - IPv6 Troubleshooting
        - IPv4 cannot be disabled for your VPC and subnets
        - If you cannot launch an EC2 instance in your subnet
            - It is not because it cannot acquire an IPv6
            - It is becuase there are no available IPv4 in your subnet
        - Solution: Create a new IPv4 CIDR in your subnet

    - Egress-only Internet Gateway
        - Used for IPv6 only
        - (similar to a NAT Gateway but for IPv6)
        - Allows instances in your VPC outbound connections over IPv6 while preventing the internet to initiate an IPv6 connection to your instances
        - You must update the Route Tables

    - VPC Summary
        - CIDR - IP Range
        - VPC - Virtual Private Cloud => we define list of IPv4 & IPv6 CIDR
        - Subnets - tied to an AZ, we define a CIDR
        - Internet Gateway - at the VPC level, private IPv4 & IPv6 Internet Access
        - Route Tables - must be edited to add routes from subnets to IGW, VPC Peering Connections, VPC Endpoints etc
        - Bastion Host - public EC2 instance to SSH into, that has SSH connectivity to EC2 instances in private subnets
        - NAT Instances - gives Internet access to EC2 isntances in privte subnets, Old, must be setup in a public subnet, disable Source . Destination check flag
        - NAT Gateway - managed by AWS, provides scalable Internet acces to private EC2 instances, when the target is an IPv4 address 
        - NACL - stateless, subnet rules for inbound and outbound, do not forget Ephemeral Ports
        - Security Groups - stateful, operate at the EC2 instance level
        - VPC Peering - connect two VPC's with non overlapping CIDR, non-transitive
        - VPC Endpoints - provides private access to AWS Services (S3, DynamoDB, CloudFormation, SSM) within a VPC
        - AWS PrivateLink / VPC Endpoint Services
            - Connect services privately from your service VPC to customers VPC
            - Does not need VPC Peering, public Internet, NAT Gateway, Route Tables
            - Must be used with Network Load Balancer & ENI
        - Egress-only Internet Gateway - like a NAT Gateway, bu for IPv6 targets
        - Transit Gateway - transitive peering connections for VPC, VPN & DX