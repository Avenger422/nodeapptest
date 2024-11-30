FROM node:latest as build

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 4000
#CMD [ "node", "index.js" ]

#FROM gcr.io/distroless/nodejs22-debian12
FROM scratch
COPY --from=build /usr/src/app /usr/src/app
CMD [ "node", "index.js" ]
