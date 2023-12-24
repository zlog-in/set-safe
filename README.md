# Set Safe
This is a simple tool to set up Safe contracts (**version 1.3.0**) on an EVM-compatible blockchain (not ZK one), to enable the MultiSig functionality on the target blockchain.

**Notes**: To know more details about how to deploy Safe contracts, please refer to [this blog](https://www.zlog.in/post/deploy-safe-contracts/).

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

**Third**, send some native token (such as 0.01 ETH) to the address `0x3fAB184622Dc19b6109349B94811493BF2a45362` on the target blockchain

Last, just run the bash script:
```
bash set-safe.sh
```

If everything goes well, you will see the addresses of the Safe contracts on the target blockchain:
```
"SimulateTxAccessor" at 0x59AD6735bCd8152B84860Cb256dD9e96b85F69Da
"GnosisSafeProxyFactory" at 0xa6B71E26C5e0845f74c812102Ca7114b6a896AB2
"DefaultCallbackHandler" at 0x1AC114C2099aFAf5261731655Dc6c306bFcd4Dbd
"CompatibilityFallbackHandler" at 0xf48f2B2d2a534e402487b3ee7C18c33Aec0Fe5e4
"CreateCall" at 0x7cbB62EaA69F79e6873cD1ecB2392971036cFAa4
"MultiSend" at 0xA238CBeb142c10Ef7Ad8442C6D1f9E89e07e7761
"MultiSendCallOnly" at 0x40A2aCCbd92BCA938b02010E17A5b8929b49130D
"SignMessageLib" at 0xA65387F16B013cf2Af4605Ad8aA5ec25a2cbA3a2
"GnosisSafeL2" at 0x3E5c63644E683549055b9Be8653de26E0B4CD36E
"GnosisSafe" at 0xd9Db270c1B5E3Bd161E8c8503c55cEABeE709552
```
and the local verification status of the contracts:
```
Verification status for SimulateTxAccessor: FAILURE
Verification status for GnosisSafeProxyFactory: SUCCESS
Verification status for DefaultCallbackHandler: SUCCESS
Verification status for CompatibilityFallbackHandler: SUCCESS
Verification status for CreateCall: SUCCESS
Verification status for MultiSend: FAILURE
Verification status for MultiSendCallOnly: SUCCESS
Verification status for SignMessageLib: SUCCESS
Verification status for GnosisSafeL2: SUCCESS
Verification status for GnosisSafe: SUCCESS
```

Now you've deployed the Safe contracts on the target blockchain, and should publish these addresses to the [safe-deployments](https://github.com/safe-global/safe-deployments/tree/main/src/assets/v1.3.0) repository.





