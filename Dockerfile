FROM registry.nexdev.net:5050/docker/node:17.9-slim 
#17.9-alpine3.14
#registry.nexdev.net:5050/docker/node:14.15.1-slim registry.nexdev.net:5050/docker/node:14.16-alpine

#USER root

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
adsfds
# Bundle app source
COPY . .
# Create a group and user
#RUN addgroup --gid 1410 appgroup
#RUN adduser -D -u 1410 appuser --group appgroup
#RUN chown -R appuser:appgroup /usr/src/app
#USER appuser
USER node
CMD [ "node","--max-old-space-size=8192", "--es-module-specifier-resolution=node", "app.js" ]
#HEALTHCHECK --interval=10s CMD node --es-module-specifier-resolution=node healthcheck.js

#CMD [ "node", "--max-old-space-size=8192", "--es-module-specifier-resolution=node", "./app.js" ]
