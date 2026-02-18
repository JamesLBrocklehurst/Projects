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
