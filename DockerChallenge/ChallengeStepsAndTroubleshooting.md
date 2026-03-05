This challenge was set by the team at CoderCo and was designed to test users' knowledge of Docker and containerization. 

The challenge was to create a simple Flask web application that connects to a Redis database.

The outline of the challenge can be seen [here](https://github.com/CoderCo-Learning/containers-intro/tree/main/challenge).

### Step 1:

First thing I needed to do was work out the folder structure for the project.

project/

    app/
        app.py
        requirements.txt
        Dockerfile

docker-compose.yml

### Step 2:

Create the flask app within the app.py file.

### Step 3:

Create the Dockerfile populate it with the necessary instructions to install the dependencies to run the flask app and the redis db.

### Step 4:

Create the docker-compose.yml file to create the containers for the flask app and the redis db and to link them together.

## Bonus Solution: Persistent Storage

To add persistent storage to the Redis container, we can use Docker volumes. This allows us to store the Redis data on the host machine, so that it persists even if the container is stopped or removed.

This is done by adding the below lines to the docker-compose.yml file under the redis service:

```yml
    volumes:
      - redis_data:/data
volumes:
  redis_data:
```

## Bonus Solution: Environment Variables

This involved changing the app.py file to read the Redis host and port from environment variables, and then updating the docker-compose.yml file to set those environment variables for the app service.

Firstly you need to update the app.py file to read the Redis host and port from environment variables:

```python
app = Flask(__name__)
redis_host = os.getenv("REDIS_HOST", "redis")
redis_port = int(os.getenv("REDIS_PORT", 6379))
r = redis.Redis(host=redis_host, port=redis_port)
```

Then you need to update the docker-compose.yml file to set those environment variables for the app service:

```yml
    environment:
      - REDIS_HOST=redis
      - REDIS_PORT=6379
```

## Bonus Solution: Load Balancing with nginx

Firstly change "ports" in the docker-compose.yml file to "expose" for the web service:

```yml
    expose:
      - "5000"
```
Next we need to add a new service for nginx in the docker-compose.yml file:

```yml
nginx:
  image: nginx:latest
  ports:
    - "5000:5000"
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf
  depends_on:
    - web
```
Finally we need to create the nginx.conf file to configure nginx to load balance between the two web containers:

```nginx
events {}

http {
    upstream flask_app {
        server web:5000;
    }

    server {
        listen 5000;
        server_name _;

        location / {
            proxy_pass http://flask_app;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_http_version 1.1;
            proxy_set_header Connection "";
            proxy_buffering off;
        }
    }
}
```