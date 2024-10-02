FROM nginx
RUN apt update
RUN apt install vim -y
COPY var.html  /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html<<<<<<< patch-39
MAINTAINER goms training@cubensquare.co
