#docker network create --driver=overlay --attachable traefik-public
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID
export EMAIL=
export DOMAIN=
export USERNAME=
export PASSWORD=
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
export CF_DNS_API_TOKEN=
docker stack deploy -c docker-compose.yml traefik
