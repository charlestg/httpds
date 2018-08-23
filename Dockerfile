FROM httpd
MAINTAINER Charles Chen

EXPOSE 443

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

RUN sed -i 's%#ServerName www.example.com:80%ServerName ${SERVER_NAME}:80%' conf/httpd.conf

ADD domain.crt /usr/local/apache2/conf/server.crt
ADD domain.key /usr/local/apache2/conf/server.key


ENV SERVER_NAME test@test.httpds.com

