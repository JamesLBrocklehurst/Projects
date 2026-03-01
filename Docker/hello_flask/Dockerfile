
# Use an official Python runtime as a parent image
FROM python:3.8-slim
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . .
# Install needed packages for MySQL client
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

# Install any needed packages specified in requirements.txt
RUN pip install flask mysqlclient
# Make port 5000 available to the world outside this container
EXPOSE 5000
# command to run the application
CMD ["python", "app.py"]

# To build the image, run: docker build -t hello-flask .

# Use this command to run the container: docker run -d -p 5000:5000 hello-flask 

# `docker network create my-network` to create a network for the containers to communicate

# `docker run -d --name mydb --network my-custom-network -e MYSQL_ROOT_PASSWORD="enterSQLpassword" mysql:5.7` to run the MySQL container

# `docker run -d --name myapp --network my-custom-network -p 5000:5000 hello-flask-mysql` to run the Flask app container and connect it to the MySQL container

# `docker build -t hello-flask-mysql .` to build the Flask app image with MySQL client support

# `docker build -t jlbrock/flask-mysql:v1 .` to build the image and tag it for pushing to Docker Hub.

# `docker push jlbrock/flask-mysql:v1` to push the image to Docker Hub.

# `docker pull jlbrock/flask-mysql:v1` to pull the image from Docker Hub on another machine.