# Dockerfile for Hyperledger fabric base image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

# Currently, the binary will look for config files at corresponding path.
FROM golang:1.7
MAINTAINER Fan Jiang <fan.torchz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Prepare to build rocksdb
## Upgrade your gcc to version at least 4.7 to get C++11 support.
RUN apt-get update -y && apt-get install -y build-essential checkinstall
## Install all the dependencies for rocksdb
RUN apt-get install -y libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev \
        && rm -rf /var/cache/apt

# Install rocksdb 4.1
RUN cd /tmp \
        && git clone --single-branch -b v4.1 --depth 1 https://github.com/facebook/rocksdb.git \
        && cd rocksdb \
        && PORTABLE=1 make shared_lib \
        && INSTALL_PATH=/usr/local make install-shared \
        && ldconfig \
        && rm -rf /tmp/rocksdb

RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production

# Install hyperledger fabric
RUN mkdir -p $GOPATH/src/github.com/hyperledger \
        && cd $GOPATH/src/github.com/hyperledger \
        && git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric \
        && cd $GOPATH/src/github.com/hyperledger/fabric/peer \
        && CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install \
        && go clean

# This is to keep compatible
RUN PATH=$GOPATH/src/github.com/hyperledger/fabric/build/bin:$PATH

WORKDIR $GOPATH/src/github.com/hyperledger/fabric
