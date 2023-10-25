FROM golang:1.20

WORKDIR /app

COPY generate-cue-mod /app

RUN go install cuelang.org/go/cmd/cue@latest && \
    go mod init github.com/crossplane-contrib/function-cue

CMD ./generate-cue-mod
