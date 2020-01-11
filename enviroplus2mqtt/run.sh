#!/bin/bash

CONFIG_PATH=/data/options.json

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)
if [[ $(jq --raw-output ".data_path" $CONFIG_PATH) == "true" ]] then
  PMS5003="--use-5003"
else
  PMS5003=""
fi

python3 /enviroplus2mqtt/enviroplus-mqtt/src/main.py \
--host $(jq --raw-output ".host" $CONFIG_PATH) \
--port $(jq --raw-output ".port" $CONFIG_PATH) \
--username $(jq --raw-output ".username" $CONFIG_PATH) \
--password $(jq --raw-output ".password" $CONFIG_PATH) \
--client-id $(jq --raw-output ".client-id" $CONFIG_PATH) \
--interval $(jq --raw-output ".interval" $CONFIG_PATH) \
--delay $(jq --raw-output ".delay" $CONFIG_PATH) $PMS5003