FROM golang:1.19

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /webhook

EXPOSE 8080

# Run
CMD ["/webhook","--log-file","/var/log/audit.log"]