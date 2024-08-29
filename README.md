# TrustLynx e-seal stamping configuration
## Prerequisites
- docker
- docker-compose
```
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Run command
Navigate to docker-compose.yml folder and run ```docker-compose up -d```
## Stop command
Navigate to docker-compose.yml folder and run ```docker-compose down```
## docker-compose.yml configuration
```
version: '3.8'
services:
  container-and-signature-services:
    container_name: container-and-signature-services
    restart: always
    ports:
      - '86:8092'
    volumes:
      - C:/dev/DMSS-stamping/container-and-signature-services:/confs
    environment:
      - SPRING_CONFIG_LOCATION=/confs/
    image: 'trustlynx/container-signature-service:24.2.0.2'
  digital-stamping-service:
    container_name: digital-stamping-service
    restart: always
    ports:
      - '84:8084'
    volumes:
      - C:/dev/DMSS-stamping/digital-stamping-service:/confs
    environment:
      - SPRING_CONFIG_LOCATION=/confs/
    image: 'trustlynx/dmss-digital-stamping-service:24.0.0.2'
networks:
  default:
```
- configure volumes override to correspond your environment
- configure ports / mapped ports if needed
## Configure application.yml configuration file for container-and-signature-services and digital-stamping-service
- As you could see from docker-compose, we are overriding configuration path of both services in order to have external configuration available outside of container. This approach allows us to change configuration, restart container and overview changes.
- container-and-signature application.yml by default not requires extra configuration and should be correctly working by default.
- digital-stamping-service configuration is unique and is based on a technology used (HSM / cryptostick USB device). In order to execute it, please contact TrustLynx colleagues.
