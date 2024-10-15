FROM node:10.4.0 as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .


FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/front /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]