FROM nginx
RUN apt update
RUN apt install vim -y
RUN apt install nano -y
RUN apt install bind-utils -y
COPY var.html  /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html
MAINTAINER goms projects@cubensquare.com
