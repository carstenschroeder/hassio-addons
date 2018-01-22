#!/bin/bash
set -e

echo "[Info] Starting FTP Backup docker!"

CONFIG_PATH=/data/options.json
ftpprotocol=$(jq --raw-output ".ftpprotocol" $CONFIG_PATH)
ftpserver=$(jq --raw-output ".ftpserver" $CONFIG_PATH)
ftpport=$(jq --raw-output ".ftpport" $CONFIG_PATH)
ftpbackupfolder=$(jq --raw-output ".ftpbackupfolder" $CONFIG_PATH)
ftpusername=$(jq --raw-output ".ftpusername" $CONFIG_PATH)
ftppassword=$(jq --raw-output ".ftppassword" $CONFIG_PATH)
addftpflags=$(jq --raw-output ".addftpflags" $CONFIG_PATH)
zippassword=$(jq --raw-output ".zippassword" $CONFIG_PATH)

ftpurl="$ftpprotocol://$ftpserver:$ftpport/$ftpbackupfolder/"
credentials=""
if [ "${#ftppassword}" -gt "0" ]; then
	credentials="-u $ftpusername:$ftppassword"
fi
	
today=`date +%Y%m%d%H%M%S`
hassconfig="/config"
hassbackup="/backup"
zipfile="homeassistant_backup_$today.zip"
zippath="$hassbackup/$zipfile"

echo "[Info] Starting backup creating $zippath"
cd $hassconfig
zip -P $zippassword -r $zippath . -x ./*.db ./*.db-shm ./*.db-wal
echo "[Info] Finished archiving configuration"

echo "[Info] trying to upload $zippath to $ftpurl"
curl $addftpflags $credentials -T $zippath $ftpurl
echo "[Info] Finished ftp backup"
