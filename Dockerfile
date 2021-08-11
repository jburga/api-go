FROM golang:1.16.1 as build
WORKDIR /go/src/github.com/api-go/
COPY ..
RUN CGO_ENABLE=0 GO111MODULE=off GOOS=linux go build -a -installsufix cgo -o application .

FROM alpine
WORKDIR /app
COPY --from=build /go/src/github.com/api-go/application .

CMD [" ./application"]
