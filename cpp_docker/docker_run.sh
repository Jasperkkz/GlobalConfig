if [ $# -gt 0 ]; then
    docker stop "$@" > /dev/null
    echo "stop container $@"
    docker rm -f "$@" > /dev/null
    echo "remove container $@"
fi

#创建开发容器
container_id=$(docker run -it -d \
  -p 2200:24 \
  -p 8000:8000 -p 8001:8001 -p 8002:8002 \
  --name cpp_dev \
  -v /home/evan/my_prj:/home/developer/dev \
  --privileged=true \
  --ulimit core=-1 \
  my_cpp_dev:latest)

echo "container id: $container_id"
docker logs $container_id

./docker_exec.sh $container_id
