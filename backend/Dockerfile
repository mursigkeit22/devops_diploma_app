FROM golang:1.13-alpine
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
WORKDIR ./cmd/api
RUN go build -o /dockerback
EXPOSE 8081
ENTRYPOINT ["/dockerback"]
