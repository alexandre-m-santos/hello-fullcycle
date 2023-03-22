FROM golang:1.20.2-alpine3.17 AS build

WORKDIR /app

RUN mkdir app

COPY hello_fullcycle.go /app/

RUN cd /app && \
    go build hello_fullcycle.go 

FROM scratch

COPY --from=build /app/hello_fullcycle /app/

CMD [ "/app/hello_fullcycle" ]