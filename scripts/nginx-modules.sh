#!/bin/bash

#Get NPS source
NGINX_SRC=/home/build
mkdir $NGINX_SRC
bash <(curl -f -L -sS https://ngxpagespeed.com/install) \
    --dynamic-module \
    -b ${NGINX_SRC}
NPS_DIR=incubator-pagespeed-ngx-latest-stable

# Get nginx source
cd $NGINX_SRC
wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xzvf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}

./configure --with-compat --add-dynamic-module=${NGINX_SRC}/${NPS_DIR}
make modules
echo "*******************"
# cp ${NGINX_SRC}/nginx-${NGINX_VERSION}/objs/ngx_pagespeed.so /etc/nginx/modules/