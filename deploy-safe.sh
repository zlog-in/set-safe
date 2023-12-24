#!/bin/bash
source .env
git submodule update --init --recursive
# Get ChainID
hexChainID=$(curl --location --request POST "$RPC" \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "method": "eth_chainId",
    "params": [],
    "id": 1
}' | jq '.result')
trimmedChainID=$(echo $hexChainID | tr -d '"')
chainID=$(printf "%d\n" $trimmedChainID)
echo "ChainID $chainID"

pushd lib/safe-singleton-factory

yarn install
# Setup singleton env file
printf "RPC=\"$RPC\"\n" > .env


gasPrice=$(yarn estimate | sed -n "s/.*gasPrice: '\([^']*\)'.*/\1/p")

mkdir -p artifacts/$chainID
printf "{
	\"gasPrice\": $gasPrice,
	\"gasLimit\": 100000,
	\"signerAddress\": \"0x3fab184622dc19b6109349b94811493bf2a45362\",
	\"transaction\": \"0xf8a58085174876e800830186a08080b853604580600e600039806000f350fe7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf31ba02222222222222222222222222222222222222222222222222222222222222222a02222222222222222222222222222222222222222222222222222222222222222\",
	\"address\": \"0x4e59b44847b379578588920ca78fbf26c0b4956c\"
}" > artifacts/$chainID/deployment.json

yarn submit

popd

pushd lib/safe-contracts
git checkout v1.3.0-libs.0
yarn install
printf "PK=\"$PK\"\nNODE_URL=\"$RPC\"\n" > .env
yarn deploy-all custom
popd

echo "Completed Safe contracts deployment"