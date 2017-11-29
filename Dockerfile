FROM ubuntu:16.04

MAINTAINER Yifan Wang <wangyifan1995@gmail.com>

# Add 2048 stuff into Nginx server
RUN apt-get -y update
RUN apt-get -y install nginx python-dev php

#配置Nginx，并设置在标准输出流输出日志（这样执行容器时才会看到日志）
RUN sed -i "s#root   html;#root   /usr/share/nginx/html;#g" /etc/nginx/nginx.conf

#Nginx日志输出到文件
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

# Start Nginx and keep it running background and start php
CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
