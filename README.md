# hassio-addons

## About

Hass.io allows anyone to create add-on repositories to share their add-ons for
Hass.io easily. This repository is one of those repositories.

## Installation

Adding this add-ons repository to your Hass.io Home Assistant instance is
pretty easy. Follow https://home-assistant.io/hassio/installing_third_party_addons/ on the
website of Home Assistant, and use the following URL:

```txt
https://github.com/carstenschroeder/hassio-addons/
```

## Add-ons provided by this repository

### [config-rsync]

This simple addon transfers the Hass.io folders to a remote rsync server.

### [ftp-backup]

This simple addon will create a password protected ZIP Archive of the configuration stored under /config (explucing the Database).
The Archive will be permanently stored under /backup as homeassistant_backup_*.zip

On top of this it will upload the the archive to the specified FTP Server.

Please note that using a FTP Protocol is not secure as the ftp password will be seing in clear text.
