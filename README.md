```bash
docker network create -d bridge momo_network

собираем бэк docker build -t momo-back:0.0.1 .
запускаем бэк docker run -d --name momoback --net=momo_network momo-back:0.0.1

собираем фронт docker build -t momo-front:0.0.1 .
запускаем фронт docker run -d --name momofront --net=momo_network -p 8080:8080 momo-front:0.0.1
```


# Momo Store aka Пельменная №2

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

## Frontend

```bash
npm install
NODE_ENV=production VUE_APP_API_URL=http://localhost:8081 npm run serve
```

## Backend

```bash
go run ./cmd/api
go test -v ./... 
```
