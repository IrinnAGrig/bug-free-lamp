FROM node:current-alpine3.16 

WORKDIR /app
COPY . /app
EXPOSE 3000
RUN npm install
CMD npm start