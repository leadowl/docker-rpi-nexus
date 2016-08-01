# docker-rpi-nexus
Nexus Repository Manager OSS 3.xx on Raspberry pi with docker

Only tested on Raspberry Pi 3
```
docker run -d --name nexus-data leadowl/rpi-nexus echo "data-only container for Nexus"
docker run -d -p 8081:8081 --name nexus --restart=always --volumes-from nexus-data leadowl/rpi-nexus
```
##ToDos
* make the volume container work properly with the -v swtich
