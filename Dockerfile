FROM registry.nexdev.net:5050/docker/node:14.15.1-slim

#USER root

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 5000
CMD [ "node", "app.js" ]
#HEALTHCHECK --interval=10s CMD node --es-module-specifier-resolution=node healthcheck.js

#CMD [ "node", "--max-old-space-size=8192", "--es-module-specifier-resolution=node", "./app.js" ]
