FROM node:10

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

RUN npm install -g nodemon

# Use changes to package.json to force Docker not to use the cac
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

# Add docker-compose-wait tool
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait  /opt/app/wait
RUN chmod +x  /opt/app/wait

WORKDIR /opt/app
COPY . /opt/app

# Exposing default
EXPOSE 8080/tcp 9229/tcp
CMD [ "npm", "run", "start" ]

