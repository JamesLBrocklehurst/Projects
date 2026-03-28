## CDN (CloudFront)

- Content Delivery Network (CDN)
- Improves read performance, content is cached at the edge
- Improves user experience
- 216 Point of Presence globally (edge location)
- DDoS protection (becuase worldwide), integration with Shield, AWS Web Application Firewall


- CloudFront - Origins

    - S3 Bucket
        - For distrubuting files and caching them at the edge
        - Enhanced security with CloudFront Origin Access Control (OAC)
        - OAC is replacing Origin Access Identity (OAI)
        - CloudFront can be used as an ingress (to upload files to S3)

    - Custom Origin (HTTP)
        - Application Load Balancer
        - EC2 Instance
        - S3 webesite (must first enabled the bucket as a static S3 website)
        - Any HTTP backend you want

