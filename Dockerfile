#Docker File ton create Angular app image
#Palash & Taseef
FROM node:12.16.1-alpine As builder

WORKDIR /src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder /src/app/dist/studentApp3/ /usr/share/nginx/html

