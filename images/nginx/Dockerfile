FROM nginx:latest

RUN apt-get update && \
    apt-get install -y python && \
    rm -rf /var/lib/apt/lists/*

ADD ./etc/nginx/ /etc/nginx/
ADD ./var/www/ /var/www/
ADD ./entrypoint.sh /var/tmp/

ENTRYPOINT ["/var/tmp/entrypoint.sh"]
