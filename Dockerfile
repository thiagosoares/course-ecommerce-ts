FROM node:14 as base

WORKDIR ./dist

COPY package.json ./

RUN npm i

COPY . .

FROM base as production

ENV NODE_PATH=./build

RUN npm run build

# Start
CMD [ "npm", "run", "main" ]
EXPOSE 3000

#FROM node:10.13.0-alpine
## Env
#ENV TIME_ZONE=Asia/Hong_Kong
#ENV ENV_NAME dev
#ENV EGG_SERVER_ENV dev
#ENV NODE_ENV dev
#ENV NODE_CONFIG_ENV dev
## Set the timezone in docker
#RUN apk --update add tzdata \\
#   && cp /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime \\
#   && echo "Asia/Hong_Kong" > /etc/timezone \\
#   && apk del tzdata
## Create Directory for the Container
#WORKDIR /usr/src/app
## Only copy the package.json file to work directory
#COPY package.json .
## Install all Packages
#RUN npm install
## Copy all other source code to work directory
#ADD . /usr/src/app
## TypeScript
#RUN npm run tsc
## Start
#CMD [ "npm", "start" ]
#EXPOSE 7001
