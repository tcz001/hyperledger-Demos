# hyperledger-Demos

This is a repo to put some demo usage of Hyperledger framework.

We aim to provide this for reference when a new developer can easily start
to work on Hyperledger, and quickly prototype a live demo for analysis.


## Quick start

```
git clone https://github.com/tcz001/hyperledger-demo
cd hyperledger-demo/docker/
docker-compose build
```

## Chaincode

First start the peer container:
```
docker-compose up peer
```

Run a bash shell in this container:
```
docker exec -i -t peer /bin/bash
```

Deploy a Chaincode:
This will create a new container named `mycc` in your docker host specified in CORE_VM_ENDPOINT of docker-compose.yml
You can change the host to somewhere else to deploy chaincode container.
```
go get github.com/tcz001/hyperledger-Demos/chaincodes/simple_transaction
peer chaincode deploy -n 'mycc' -p github.com/tcz001/hyperledger-Demos/chaincodes/simple_transaction -c '{"Function":"init", "Args": ["a","100", "b", "200"]}'
```

Invoke and Query a Chaincode:
```
peer chaincode invoke -n 'mycc' -c '{"Function": "invoke", "Args": ["a", "b", "10"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["a"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["b"]}'
```
