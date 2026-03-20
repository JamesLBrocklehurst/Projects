**Security Groups**

 - Only contain allow rules
 - Are stateful
 - Control how traffic is allowed into or out of our EC2 instances
 - Act like a firewall for EC2 instances
    - Access to Ports
    - Authorised IP ranges - IPv4 and IPv6
    - Control inbound and outbound network traffic

- Good to know
   - Can be attached to multiple instances
   - Locaked down to a region / VPC combination
   - Does live "outside" the EC2 (if traffic is blocked the EC2 instance won't see it)
   - Good practise to maintain one seperate security group for SSH access
   - If your application is not accessible (time out), then it's a security group issue
   - if your application gives a "connection refused" error, then it's an application error or it's not launched
   - All inbound traffic is blocked by default
   - All outbound traffic is authorised by default

- Ports to know
   - 22
      - SSH (Secure shell) - log into a linux instance
   - 21
      - FTP (File Transfer Protocol) - upload files into a file share
   - 22
      - SFTP (Secure File Transfer Protocol) - upload files using SSH
   - 80
      - HTTP - access unsecured websites
   - 443
      - HTTPS - access secured wesbites
   - 53 
      - DNS - for DNS queries and resolving
   - 3389
      - RDP (Remote Desktop Protocol) - log into a Windows instance

- Public Vs Private IP (IPv4) Differences

| Public | Private |
|:-|:-|
|Public IP means the machine can be identified on the internet (WWW)|Private IP means the machine can only be identified on a private network|
|Must be unique across the whole web (no two machines can have the same public IP)|The IP must be unique across the private network|
|Can be geo-located easily|Two different private networks (Two Companies) can have the same IPs|
||Machines connect to WWW using a NAT + internet gateway (proxy)|
||Only a specified range of IPs can be used as private IP|

- Elastic IPs
   - When you stop and then start an EC2 instance, it can change its IP.
   - If you need to have a fixed public IP for your instance, you need an Elastic IP.
   - An Elastic IP is a public IPv4 IP you own as long as you don't delete it.
   - You can attach it to one instance at a time.

- When to use an Elastic IP
   - With an Elastic IP address, you can mask the failure of an instance or software by rapdily remapping the address to another instance in your account
   - You cna only have 5 Elastic IP's in your account (You can get AWS to increase that number)
   - Overall, try to avoid using Elastic IP
      - They often reflect poor architectual decisions
      - Instead, use a random pbulic IP and register a DNS name to it
      - Or use a Load Balancer and don not use a public IP

