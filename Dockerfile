FROM node:16.17.0-alpine as builder
WORKDIR /app
COPY . .
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
