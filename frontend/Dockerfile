FROM node:16-alpine as builder
WORKDIR /app
COPY ["package.json", "package-lock.json", "./"]
RUN npm install
COPY . .
ENV NODE_ENV=production
RUN npm run build

FROM nginx:latest
COPY --from=builder /app/dist/ /usr/share/nginx/html

EXPOSE 8080
