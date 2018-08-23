# httpds
https server with self signed cert for quick test

## Docker Run

```
docker run -d \
    -p 8443:443 \
    -p 8080:80 \
    --name httpds \
    -v `pwd`:/usr/local/apache2/htdocs/ \
    charlestg/httpds
    
```

## Docker Run with different SSL cert

```
docker run -d \
    -p 8443:443 \
    -p 8080:80 \
    --name httpds \
    -v `pwd`:/usr/local/apache2/htdocs/ \
    -v domain.crt:/usr/local/apache2/conf/server.crt \
    -v domain.key:/usr/local/apache2/conf/server.key \
    -e SERVER_NAME=test@test.httpds.com \
    charlestg/httpds
