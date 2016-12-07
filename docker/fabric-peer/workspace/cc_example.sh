#!/bin/bash
go get github.com/tcz001/hyperledger-Demos/chaincodes/simple_transaction
peer chaincode deploy -n 'mycc' -p github.com/tcz001/hyperledger-Demos/chaincodes/simple_transaction -c '{"Function":"init", "Args": ["a","100", "b", "200"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["a"]}'
peer chaincode invoke -n 'mycc' -c '{"Function": "invoke", "Args": ["a", "b", "10"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["a"]}'
