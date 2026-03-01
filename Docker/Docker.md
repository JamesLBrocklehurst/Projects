## Docker

Docker is a open platform for developing, shipping, and running applications. It allows you to package your application and its dependencies into a container, which can run on any system that has Docker installed.

Docker Engine:
A portable, lightweight application runtime and packaging tool. It allows you to build, run, and manage containers on a single host.

Docker Hub:
A cloud service for sharing applications and automating workflows. It provides a central repository for Docker images, which can be used to share and distribute applications.

Containers vs Virtual Machines:

|Virtual Machines| Vs |Containers|
|----------------|----|----------|
| Takes minutes | Startup time | Start within seconds |
| Consume more resources | Resource usage | Lightweight and efficient |
| Strong isolation | Isolation | Shared kernel, less isolation |
| Less portability | Portability | Highly portable across environments |

Useful commands:
`docker ps` - List running containers

`docker ps -a` - List all containers (including stopped)

`docker info` - Display system-wide information

`docker --version` - Show Docker version information

`from` - Specify the base image for a Dockerfile

`run` - Run a command in a new container

`build` - Build an image from a Dockerfile

`copy` - Copy files from the host to the container

`workdir` - Set the working directory for the container

`command` - Specify the command to run when the container starts

`cmd` - Similar to `command`, but allows for more complex commands and arguments

`docker images` - List all Docker images on the system

`docker inspect <container_id>` - Display detailed information about a container

`docker rmi <image_id>` - Remove a Docker image from the system, if the image is not being used by any containers.

`docker system prune` - Remove all unused data, including stopped containers, unused networks, dangling images, and build cache.

`docker stop <container_id>` - Stop a running container

`docker rm <container_id>` - Remove a stopped container

## Docker Networking

Bridge Network:
The default network driver for Docker. It creates a private internal network on the host machine, allowing containers to communicate with each other and with the host.

Host Network:
This network driver allows containers to share the host's network stack. Containers using the host network can access the host's network interfaces directly, but they cannot communicate with other containers on the same host.

None Network:
This network driver disables all networking for the container. Containers using the none network cannot communicate with other containers or the host.

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to define your application's services, networks, and volumes in a single YAML file, making it easier to manage and deploy your application.

Makes Development and Testing easier

## Docker Registries 

Stoarege and distribution system for Docker images. It allows you to share and distribute your Docker images with others.

Key features of Docker Registries include:

- Public Registries i.e docker hub

- Private Registries i.e AWS ECR

Importance in DevOps:

Streamline development

Enchance collaboration

Ensure consistency across environments

## Kubernetes

Always you to manage and orchestrate containerized applications at scale. It provides a platform for automating deployment, scaling, and operations of application containers across clusters of hosts.

## Docker Swarm Vs Kubernetes

|Docker Swarm| Vs |Kubernetes|
|------------|----|----------|
| Simpler to set up and use | Ease of Use | More complex, with a steeper learning curve |
| No auto Scaling | Scaling | Supports auto-scaling of containers based on resource usage |
| Good Community Support | Community Support | Larger and more active community, with more resources and tools available |
| Easy to start a Cluster | Cluster Management | Provides more advanced features for managing clusters, such as rolling updates and self-healing. But it is difficult to start a cluster from scratch |
| Limited to the Docker API's capabilties | API | More flexible and extensible, with a wider range of APIs and integrations available |

Docker Swarm is easier to use and native to Docker, making it a good choice for smaller applications or teams that are already familiar with Docker. 

Kubernetes, on the other hand, is more powerful and feature-rich, making it a better choice for larger applications or teams that require more advanced features and scalability (Enterprise level applications).