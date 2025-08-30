docker container prune
docker volume prune
podman rm --force $(docker ps --external -q)