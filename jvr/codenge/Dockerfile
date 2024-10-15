FROM node:10.4.0 as build-stage

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM nginx:stable-alpine as production-stage

# Copiar a aplicação compilada
COPY --from=build-stage /app/front /usr/share/nginx/html

# Remover a configuração padrão do NGINX
RUN rm /etc/nginx/conf.d/default.conf

# Copiar o arquivo de configuração customizado
COPY default.conf /etc/nginx/conf.d

# Copiar os certificados SSL (ou use volumes se os certificados estiverem fora do contêiner)
# COPY /etc/self-signed.crt /etc/nginx/certs/self-signed.crt
# COPY /etc/self-signed.key /etc/nginx/certs/self-signed.key
COPY default.conf /etc/nginx/conf.d


# Expor as portas HTTP e HTTPS
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
