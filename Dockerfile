FROM golang:latest AS build

WORKDIR /app

COPY go.mod ./

COPY main.go ./

RUN go build -o /go-fullcycle

FROM scratch

WORKDIR /

COPY --from=build /go-fullcycle /go-fullcycle

ENTRYPOINT [ "/go-fullcycle" ]