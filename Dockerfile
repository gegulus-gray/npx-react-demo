## build environment JS
FROM node:latest AS build

WORKDIR /app
COPY . /app

RUN npm install
RUN npm install react-scripts
RUN npm run build


## build web-server
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html