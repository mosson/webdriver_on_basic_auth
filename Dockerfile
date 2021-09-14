FROM nginx:1.17

RUN apt-get -y update && apt-get install -y libssl-dev openssl

RUN echo "hoge:$(openssl passwd -apr1 fuga)" >> "/usr/share/nginx/.htpasswd"
