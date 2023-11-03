FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install php-fpm php-mysql -y && apt install curl -y
COPY ./tools/config.sh .
RUN chmod 777 ./config.sh
CMD [ "/config.sh" ]
