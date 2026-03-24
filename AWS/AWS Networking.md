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
    