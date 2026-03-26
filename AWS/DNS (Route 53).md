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
    
    