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
