# Dockerfile for Hyperledger fabric base image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

# Currently, the binary will look for config files at corresponding path.
FROM golang:1.7
MAINTAINER Fan Jiang <fan.torchz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production

# Install hyperledger fabric
RUN mkdir -p $GOPATH/src/github.com/hyperledger \
        && cd $GOPATH/src/github.com/hyperledger \
        && git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric

# Build hyperledger orderer
RUN cd $GOPATH/src/github.com/hyperledger/fabric/orderer \
        && go install \
        && go clean

# Initialize orderer server
ENV ORDERER_HOME=/tmp/orderer
ENV ORDERER_CFG_PATH=$ORDERER_HOME
WORKDIR $ORDERER_HOME
ADD workspace/* ./
