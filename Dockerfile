# Build phase

FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# nginx container default command is starting the nginx server so we don't need to execute anything here
