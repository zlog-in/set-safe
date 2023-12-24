# Set Safe
This is a simple tool to set up Safe contracts on an EVM-compatible blockchain (not ZK one), to enable the MultiSig functionality on this blockchain.

This tool depends on two repositories:
* [safe-singleton-factory](https://github.com/safe-global/safe-singleton-factory)
* [safe-contracts](https://github.com/safe-global/safe-contracts)

## Set Up
First, clone this  repository:
```
git clone https://github.com/zlog-in/set-safe.git && cd set-safe 
```
Then, set an .env file with the following variables:
```
export PK="your private key"
export RPC="the rpc url of the blockchain"
```
Last, just run the bash script:
```
bash set-safe.sh
```





