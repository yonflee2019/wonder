FROM node:bullseye-slim

WORKDIR /app
ENV TZ="Asia/Shanghai" \
  NODE_ENV="production" \
  ARGO_DOMAIN="" \
  ARGO_AUTH=""

COPY package.json index.js /app/
 
EXPOSE 3000


RUN chmod 777 package.json index.js /app &&\
  apt-get update && \
  apt-get install -y curl procps && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  npm install


CMD ["node", "index.js"]
