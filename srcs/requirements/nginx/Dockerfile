FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install nginx -y && apt install openssl -y
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;"]
