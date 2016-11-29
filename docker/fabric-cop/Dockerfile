# Dockerfile for Hyperledger fabric-COP base image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric-cop

# Currently, the binary will look for config files at corresponding path.
FROM golang:1.7
MAINTAINER Fan Jiang <fan.torchz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install hyperledger fabric-COP
RUN go get github.com/go-sql-driver/mysql \
        && go get github.com/lib/pq

RUN mkdir -p $GOPATH/src/github.com/hyperledger \
        && cd $GOPATH/src/github.com/hyperledger \
        && git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric-cop \
        && cd $GOPATH/src/github.com/hyperledger/fabric-cop \
        && go install \
        && go clean \
        && make cop

ENV PATH $PATH:$GOPATH/src/github.com/hyperledger/fabric-cop/bin

# Initialize cop server
ENV COP_HOME=/tmp/cop
WORKDIR $COP_HOME
ADD workspace/* ./
RUN cop server init ./csr_dsa.json
