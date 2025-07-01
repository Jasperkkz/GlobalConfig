if [ $# -gt 0 ]; then
    docker stop "$@"
    echo "stop container $@"
    docker rm -f "$@"
    echo "remove container $@"
fi

docker rmi my_cpp_dev:latest

docker build -t my_cpp_dev .