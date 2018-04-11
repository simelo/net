# skywire build binaries
# reference https://github.com/skycoin/skywire
FROM golang:1.9-alpine as build


RUN apk update && apk add git
#RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN go get github.com/golang/dep/cmd/dep
WORKDIR $GOPATH/src/github.com/skycoin/net 
ADD . $GOPATH/src/github.com/skycoin/net
RUN dep ensure -v
RUN CGO_ENABLED=0 GOOS=linux go install -a -installsuffix cgo ./...
