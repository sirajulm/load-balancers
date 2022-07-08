FROM nginx:stable

USER root
ENV APP_HOME /home/app
ENV SCRIPTS_HOME /home/scripts
WORKDIR $APP_HOME
RUN apt-get update
RUN apt-get install curl build-essential zlib1g-dev libpcre3-dev unzip wget uuid-dev -y

COPY scripts/ /home/scripts/
COPY nginx-conf/nginx.conf /etc/nginx/

RUN mkdir /var/cache/nginx/client_temp
RUN chown -R nginx.nginx /var/cache/nginx/client_temp
RUN bash $SCRIPTS_HOME/nginx-modules.sh