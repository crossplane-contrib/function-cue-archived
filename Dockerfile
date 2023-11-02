FROM golang:1.21 as build-stage

WORKDIR /fn

COPY go.mod go.sum ./
RUN go mod download

COPY input/ ./input
COPY *.go ./

RUN CGO_ENABLED=0 go build -o /function .

FROM debian:12.2-slim as package-stage

WORKDIR /package
COPY package/ ./

RUN cat crossplane.yaml > /package.yaml
RUN cat input/*.yaml >> /package.yaml

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /function /function
COPY --from=package-stage /package.yaml /package.yaml
COPY cue.mod/ ./cue.mod
COPY lib/ ./cuelib

EXPOSE 9443

USER nonroot:nonroot

ENTRYPOINT ["/function"]
