#!/bin/bash
set -e

echo "[Info] Starting FTP Backup docker!"

CONFIG_PATH=/data/options.json
rsyncserver=$(jq --raw-output ".rsyncserver" $CONFIG_PATH)
folder=$(jq --raw-output ".folder" $CONFIG_PATH)
username=$(jq --raw-output ".username" $CONFIG_PATH)
password=$(jq --raw-output ".password" $CONFIG_PATH)

rsyncurl="$username@$rsyncserver::$folder/"
hassconfig="/config/"

echo "[Info] trying to rsync $hassconfig to $rsyncurl"
 sshpass -p $password rsync -av $hassconfig $rsyncurl 
curl $addftpflags $credentials -T $zippath $ftpurl
echo "[Info] Finished rsync"
