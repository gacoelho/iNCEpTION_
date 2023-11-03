#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=BR/L=RJ/O=42/OU=student/CN=gacoelho.42.fr"
echo " server{
    listen 443 ssl;
    listen [::]:433 ssl;

    server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate $CERTS_;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;" > /etc/nginx/sites-available/default
echo '
    location ~ [^/]\\.php(/|$){
        try_files $uri =404;
        fastcgi_pass wordpress:9000;
        include fastcgi_params;
        fastcgi_param SCRIPT__FILENAME $document_root$fastcgi_sprit_name;
    }
}' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"