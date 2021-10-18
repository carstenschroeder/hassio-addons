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
printf %s "$password" | sshpass -d0 rsync -av --exclude '*.db-shm' --exclude '*.db-wal' /config/ $rsyncurl/config/
echo ""
echo "[Info] /addons"
printf %s "$password" | sshpass -d0 rsync -av /addons/ $rsyncurl/addons/
echo ""
echo "[Info] /backup"
printf %s "$password" | sshpass -d0 rsync -av /backup/ $rsyncurl/backup/
echo ""
echo "[Info] /share"
printf %s "$password" | sshpass -d0 rsync -av /share/ $rsyncurl/share/
echo ""
echo "[Info] /ssl"
printf %s "$password" | sshpass -d0 rsync -av /ssl/ $rsyncurl/ssl/
if [ -d "/media" ]; then
 echo ""
 echo "[Info] /media"
 printf %s "$password" | sshpass -d0 rsync -av /media/ $rsyncurl/media/
else 
 echo ""
 echo "[Info] /media not existing"
fi
echo "[Info] Finished rsync"
