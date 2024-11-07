FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN n  pm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/ngixx/html