## build environment JS
FROM node:20-alpine AS build

WORKDIR /app
COPY . /app

RUN npm install & npm run build


## build web-server
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html