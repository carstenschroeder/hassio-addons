#!/bin/bash
set -e

echo "[Info] Starting Hass.io folder rsync docker container!"

CONFIG_PATH=/data/options.json
rsyncserver=$(jq --raw-output ".rsyncserver" $CONFIG_PATH)
rootfolder=$(jq --raw-output ".rootfolder" $CONFIG_PATH)
username=$(jq --raw-output ".username" $CONFIG_PATH)
#password=$(jq --raw-output ".password" $CONFIG_PATH)

rsyncurl="$username@$rsyncserver::$rootfolder"
password=="$(hass.config.get 'password')"

echo "[Info] trying to rsync hassio folders to $rsyncurl"
 sshpass -p $password rsync -av /config/ $rsyncurl/config/ 
 sshpass -p $password rsync -av /addons/ $rsyncurl/addons/ 
 sshpass -p $password rsync -av /backup/ $rsyncurl/backup/ 
 sshpass -p $password rsync -av /share/ $rsyncurl/share/ 
 sshpass -p $password rsync -av /ssl/ $rsyncurl/ssl/ 
echo "[Info] Finished rsync"
