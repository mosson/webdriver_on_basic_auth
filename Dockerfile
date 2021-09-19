FROM nginx:1.17

ARG BASIC_USER
ARG BASIC_PASSWORD

RUN apt-get -y update && apt-get install -y libssl-dev openssl

RUN echo "$BASIC_USER:$(openssl passwd -apr1 $BASIC_PASSWORD)" >> "/usr/share/nginx/.htpasswd"
