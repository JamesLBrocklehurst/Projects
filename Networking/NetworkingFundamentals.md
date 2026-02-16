### Computer Networks

LAN - Local Area Network

WAN - Wide Area Network

### Networking in DevOps

Server Interactions: Enables communication between servers and applicatiions

Deployment: Critical for launching and updating applications

Management: Crucial in monitoring and managing infrastructure 

Optimisation: Enhances troubleshooting, performance and scalability

#### LAN:

Small area, like a home or office

Connect devices to share resources

#### WAN:

Large area, like a city, country or a larger region

Connects multiple LANs

#### Key Networking Components:

Switches:

- Connect devices within the same network
- Manage data flow within a LAN

Routers:

- Direct traffic between networks
- Connect different networks

Firewalls:

- Protect networks from unauthorised access
- Monitor and control incoming & outgoing network traffic

#### IP addressing:

IP addresses are unqiue identifiers for devices on a network.

IPv4:

32-bit address

**Format:** four decimal numbers separated by dots

IPv6:

128-bit address

**Format:** eight groups of four hexadecimal digits seperated by colons

#### MAC Addresses:

MAC Addresses are unique identifiers assigned to network interfaces

Format:

48-bit address (Examples: 00:1A:2B:3C:4D:5E)

Function:

Operates at the data link layer. Facilitates device identification within a local network.

#### Ports and Protocols:

Ports - logical endpoints for communication

Protocols - rules governing data transmission

Importance - facilitates communication between devices

**TCP:**

Transmission Control Protocol

**Characteristics:**

Connection-oriented

Requires "handshake"

Reliable data transfer

**Functions:**

Ensures data is delivered in order

Error-checking and flow control

Any bidirectional communication

**UDP:**

User Datagram Protocol

**Characteristics**

Simple protocol to send and receive data

Prior communication not required (can be a double-edged sword)

Connectionless

Fast but less reliable

**Functions**

Suitable for real-time applications (e.g., video streaming)

DNS

VPN

#### TCP Vs UDP

| TCP | Comparison | UDP |
|:-|:-|:-|
| Connection-oreiented | Connection | Connectionless |
| Reliable, ensures data delivery and order | Reliability | Less reliable, no guarantee of delivery or order |
| Slower due to overhead of connection setup | Speed | Faster, no connection or handshake setup required |
| Error-checking and flow control | Error-checking | No error-checking or flow control |
| Web browsing, email, file transfer | Use-cases | Video streaming, online gaming, DNS, VPN |

### OSI Model

**Open Systems Interconnection Model**

Layer 7 - **Application Layer**
- End user layer
- HTTP, FTP, IRC, SSH, DNS

Layer 6 - **Presentation**
- Syntax user layer
- SSL, SSH, IMAP, FTP, MPEG, JPEG

Layer 5 - **Session**
- Synch & send to port
- API's, Sockets, Winsock

Layer 4 - **Transport**
- End-to-end connections
- TCP, UDP

Layer 3 - **Network**
- Packets
- IP, ICMP, IPSec, IGMP

Layer 2 - **Data Link**
- Frames
- Ethernet, PPP, Switch, Bridge

Layer 1 - **Physical**
- Physical Structure
- Coax, Fibre, Wireless, Hubs, Repeaters

### ***Physical Layer***

**Function**

Transmits raw bit stream over a physcial medium

**Components**

Cables, switches and network interface cards

### ***Data Link Layer***

**Function**

Provides node-to-node data transfer and detects erros that may occur in the Physical Layer. It ensure that data is transferred correctly between adjacent network nodes

**Components**

MAC Addresses, switches and bridges

### ***Network Layer***

**Function**

Determines how data is sent to the recipient

Manages packet forwarding including routing through intermediate routers

**Components**

IP addresses, routers

### ***Transport Layer***

**Function**

Provides reliable data transfer services to the upper layers

Segments and reassembles data

**Components**

TCP, UDP

### ***Session Layer***

**Function**

Manages sessions between applications

Establishes, maintains and terminates connections

**Components**

Session management protocols

### ***Presentation Layer***

**Function**

Translates data between the application layer and the network

Ensures data is in usable format

**Components**

Encryption, data formatting

### ***Application Layer***

**Function**

Provides network services directly to applications

End-user layer

**Components**

HTTP, FP, SMTP

### TCP/IP Model Layers:

Application layer --> HTTP, TLS, DNS

Transport Layer --> TCP, UDP

Internet Layer --> IP

Network Access Layer --> Ethernet, Wireless LAN

## DNS

DNS - Domain Name System

Definition:

Translates domain names to IP addresses

Role in Networking:

Simplifies navigation on the internet

Essential for accessing websites and services

### DNS Components

Name servers:

Load DNS settings and configurations

Can be authoritative or recursive

Zone files:

Store information about the domain

Organised and readable format

### Records

Entries in a zone file with specific information

Components: Record name, TTL, Class, Type, Data

| Record | Descripton |
|:-|:-|
| A | Maps a domain name to an IPv4 address. |
| AAAA | Maps a domain name to an IPv6 address. |
| CNAME | Alias of one name to another. It allows you to point multiple domain names to the same IP address. |
| MX | Specifies the mail server responsible for receiving email for the domain. |
| TXT | Allows domain administrators to insert any text into DNS. Commonly used for verification purposes and to hold SPF (Sender Policy Framework) data.|

## Routing

Definition - Process of determinging paths for data to travel across networks

Importance of Routing - Ensures data reaches its destination efficiently. Fundamental for Internet functionality

Routing Process:
 - Routers determin the best path
 - Use routing tables to make decisions

 Key Components:
 - Routers
 - Routing tables

### Static Vs Dynamic Routing

Static:
 - Manually configure routes
 - Fixed paths set by network administrators
 - Simple but not scalable

Dynamic:
 - Routes are automatically adjusted
 - Uses routing protocols to find the best path
 - Scalable and adaptable

### Common Routing Protocols

Routing Protocols:
 1. Automate route determination
 1. Enhance network efficiency
 1. Use algorithms that determine best paths
 1. Automate route updates 
 1. Improve network resilience

OSPF:

Open Shortest Path First

BGP:

Border Gateway Protocol

## Subnetting

- Dividing a network into smaller networks
- Improves network management and efficiency

### CIDR Notation
Classless Inter-Domain Routing

Format:
IP_address/prefix_length

Example:
192.168.0.1/24

### Binary

Base-2 number system

Uses 0 and 1

### Calculating Subnets and Host ranges

Subnet Masks: Defines network and host portions

IPv4 Classes:

Class A - 255.0.0.0

Class B - 255.255.0.0

Class C - 255.255.255.0

### NAT

Network Address Translation

Translates private IP addresses to a public IP address

Facilitates communication between internal network and the Internet

NAT Process:

- Internal devices use private IP addresses
- Router translates private IP to public IP
- Facilitates communication with external networks

### Types of NAT

Static NAT

Dynamic NAT

PAT (Port Address Translation)

### Troubleshooting

Common Network Issues
- Connectivity Loss
- Slow network performance
- IP address conflicts
- DNS resolution failures

Identifying Symptoms

Symptom: Devices can't access the network

Steps to diagnose:
- Check physical connections
- Verify network configuration
- Test with ping command

Debugging Tools:
- ping
- traceroute
- nslookup

