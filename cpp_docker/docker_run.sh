#创建开发容器
docker run -it -d \
  -p 2200:24 \
  -p 8000:8000 -p 8001:8001 -p 8002:8002 \
  --name cpp_dev \
  -v /Users/jasper/My_Dev:/home/developer/dev \
  --privileged=true \
  my_cpp_dev:latest