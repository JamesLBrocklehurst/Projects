## NGINX Deployment AWS

During this assignment I will be looking to deploy NGINX using my own custom domain. This will be hosted through AWS using an EC2 instance and Route 53.

Step 1:

I first had to purchase the domain name in order to host the NGINX deployment.

To do this I purchased the domain through AWS's own `Route 53`.

Step 2:

The next step was to deploy a EC2 instance, I selected the region of `eu-west-2` as this is London and I am in the UK so want to keep this deployment within my local region.

Once the Ubuntu instance was deployed I then connected to the instance and updated all packages, in order to do this you need to first update them upgrade as seen in the commands below:

`sudo apt update` 

`sudo apt upgrade`

Step 3:

In this step I needed to get Nginx installed on the EC2 instance. This is done through running the command `sudo apt install nginx`. Once nginx has been installed you then need to start and enable the service.

`sudo systemctl start nginx`

`sudo systemctl enable nginx`

Step 4:

Now that the nginx service has been started and enabled, I needed to point my the hosted zone within Route 53 to my EC2 instance. In order to do this you need to grab the Public IP Address of the EC2 instance and add an `A record` to your hosted zone. Within the A record the value is the IP Address of the EC2 instance.

Step 5:

Once DNS has propagated, you should be able to access the nginx welcome page by going to your domain name in a web browser. If you see the welcome page then you have successfully deployed nginx on AWS and linked it to your custom domain. If not you may need to check your DNS settings and ensure that the A record is correctly pointing to your EC2 instance. You can also use tools like `nslookup` or `dig` to check the DNS resolution for your domain and ensure that it is correctly resolving to the IP address of your EC2 instance.

Step 6:

Now that the EC2 instance and Route 53 are linked the site required aa SSL certificate to be configured. In order to do this I needed to run the command `sudo apt install certbot python3-certbot-nginx` to install certbot and the nginx plugin. Once this is installed you can then run the command `sudo certbot --nginx -d yourdomain.com` to generate the SSL certificate and configure it with nginx.

Step 7:

Once you have confirmation that the SSL certificate has been generated and configured with nginx, you can then test the secure connection by going to your domain name in a web browser and ensuring that it is using HTTPS. You should see a padlock icon in the address bar indicating that the connection is secure. If you encounter any issues with the SSL certificate, you can check that the certificate is correctly installed and configured with nginx, and that the domain name is correctly pointed to your EC2 instance. You can also use tools like `openssl` to check the SSL certificate and ensure that it is valid and correctly configured.