#! /bin/sh -eux

args=$(docker-machine config techtalklunch)
container_id=$(docker ${args} ps -a -q)

if [ ! -z "${container_id}" ]; then
  docker ${args} stop ${container_id}
  docker ${args} rm ${container_id}
fi
docker ${args} build -t jcsirot/devoxxcarpet .
docker ${args} run -ti -e DATASTORE=false -d -p 80:8080 jcsirot/devoxxcarpet
