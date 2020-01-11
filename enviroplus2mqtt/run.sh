#!/bin/bash

CONFIG_PATH=/data/options.json

USE_PMS5003=$(jq --raw-output ".use_pms5003" $CONFIG_PATH)

if [[ "${USE_PMS5003}" == "true" ]]
then
  PMS5003="--use-pms5003"
else
  PMS5003=""
fi

python3 /enviroplus2mqtt/enviroplus-mqtt/src/main.py \
--host $(jq --raw-output ".host" $CONFIG_PATH) \
--port $(jq --raw-output ".port" $CONFIG_PATH) \
--username $(jq --raw-output ".username" $CONFIG_PATH) \
--password $(jq --raw-output ".password" $CONFIG_PATH) \
--prefix $(jq --raw-output ".prefix" $CONFIG_PATH) \
--client-id $(jq --raw-output ".client_id" $CONFIG_PATH) \
--interval $(jq --raw-output ".interval" $CONFIG_PATH) \
--delay $(jq --raw-output ".delay" $CONFIG_PATH) $PMS5003