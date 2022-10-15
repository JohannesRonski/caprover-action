FROM node:18-alpine

RUN apk add --no-cache git && npm install -g caprover json && npm cache clean --force

COPY run.sh /run.sh

ENTRYPOINT ["sh","/run.sh"]
