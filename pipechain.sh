#!/usr/bin/env bash

rm -f build.log
echo -n "setup compiler 0.66.0 linker 0.20.2" | tee build.log
npx everdev sol set --compiler 0.66.0 --linker 0.20.2 &>build.log
echo " ✓"

echo -n "deploy debot in SE" | tee build.log
npx everdev network default se &>build.log
npx everdev se reset &>build.log
npx everdev contract deploy pipechain -v 1T &>build.log
npx everdev contract info pipechain | grep Address | cut -d' ' -f4 > pipechain.addr
appABI=$(< "pipechain.abi.json" jq --compact-output | xxd -ps -c 20000)
npx everdev contract run --address "$(cat pipechain.addr)" pipechain setABI --input "dabi:$appABI" &>build.log
echo " ✓"

echo -n "setup tvmos 0.35.4" | tee build.log
npx everdev tonos-cli set --version 0.35.4 &>build.log
tvmos=~/.everdev/tonos-cli/tonos-cli
$tvmos --config es.json config --is_json true --url localhost &>build.log
echo " ✓"
echo "run debot with pipechain" | tee build.log
$tvmos --config es.json debot start -m pipechain.chain.json "$(cat pipechain.addr)"
