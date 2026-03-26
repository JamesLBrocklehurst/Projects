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