#!/bin/bash
set -e

echo "[Info] Starting Hass.io folder rsync docker container!"

CONFIG_PATH=/data/options.json
rsyncserver=$(jq --raw-output ".rsyncserver" $CONFIG_PATH)
rootfolder=$(jq --raw-output ".rootfolder" $CONFIG_PATH)
username=$(jq --raw-output ".username" $CONFIG_PATH)
password=$(jq --raw-output ".password" $CONFIG_PATH)

rsyncurl="$username@$rsyncserver::$rootfolder"

echo "[Info] trying to rsync hassio folders to $rsyncurl"
echo ""
echo "[Info] /config"
 sshpass -p $password rsync -av /config/ $rsyncurl/config/ 
echo ""
echo "[Info] /addons"
 sshpass -p $password rsync -av /addons/ $rsyncurl/addons/ 
echo ""
echo "[Info] /backup"
 sshpass -p $password rsync -av /backup/ $rsyncurl/backup/ 
echo ""
echo "[Info] /share"
 sshpass -p $password rsync -av /share/ $rsyncurl/share/ 
echo ""
echo "[Info] /ssl"
 sshpass -p $password rsync -av /ssl/ $rsyncurl/ssl/ 
echo "[Info] Finished rsync"
