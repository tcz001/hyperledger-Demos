#!/bin/bash
peer chaincode deploy -n 'mycc' -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 -c '{"Function":"init", "Args": ["a","100", "b", "200"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["a"]}'
peer chaincode invoke -n 'mycc' -c '{"Function": "invoke", "Args": ["a", "b", "10"]}'
peer chaincode query -n 'mycc' -c '{"Function": "query", "Args": ["a"]}'
