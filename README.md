# hyperledger-Demos

This is a repo to put some demo usage of Hyperledger framework.

We aim to provide this for reference when a new developer can easily start
to work on Hyperledger, and quickly prototype a live demo for analysis.


## Quick start

```
git clone https://github.com/tcz001/hyperledger-demo
```

## Run fabric env

```
cd hyperledger-demo/docker/fabric
docker build -t fabric:latest .
docker run -i -t fabric:latest /bin/bash
```

## Run fabric-COP env

```
cd hyperledger-demo/docker/fabric-cop
docker build -t fabric:latest .
docker run -i -t fabric-cop:latest /bin/bash
```
