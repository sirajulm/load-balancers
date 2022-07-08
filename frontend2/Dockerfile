FROM node:latest

USER root
ENV APP_HOME /home/app
WORKDIR $APP_HOME

COPY ./ ${APP_HOME}

CMD [ "npm", "start"]