# `debot pipechain`

## Requirements

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
npm inxtall --global everdev
sudo apt-get install jq
pip install t2f
# install fift https://docs.ton.org/develop/smart-contracts/environment/installation#1-download 
```

## How to use

```shell
bash pipechain.sh
```

**out**
```shell
setup compiler 0.66.0 linker 0.20.2 ✓
compile via tmv-solidity size tvc 3410 bytes ✓
deploy debot in SE ✓
setup tvmos 0.35.4 ✓
run debot with pipechain

{
  "status": "0",
  "out": {
    "1": {
      "data": "10"
    },
    "2": {
      "data": "2020"
    }
  }
}
```
