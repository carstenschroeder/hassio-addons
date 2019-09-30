# hassio-addons

## About

Hass.io allows anyone to create add-on repositories to share their add-ons for
Hass.io easily. This repository is one of those repositories.

Thanks to @leinich, as his repo served as a template: https://github.com/leinich/hassio-addons

## Installation

Adding this add-ons repository to your Hass.io Home Assistant instance is
pretty easy. Follow https://home-assistant.io/hassio/installing_third_party_addons/ on the
website of Home Assistant, and use the following URL:

```
https://github.com/carstenschroeder/hassio-addons/
```

## Add-ons provided by this repository

### [folder-rsync]

This simple addon transfers the Hass.io folders /addons, /backup, /config, /share and /ssl to a remote rsync server (e.g. a Synology NAS).
The addon transfers the changes to the destination at every start. After the transfer it stops.

You might want to start the transfer with a HASS automation
```
- id: '7'
  alias: Folder sync to NAS
  trigger:
    platform: time
    at: '1:00:00'
  action:
  - service: hassio.addon_start
    data:
      addon: 954f2f4e_folderrsync
```

### [remote-backup]

This addon is a fork of the great backup addon https://github.com/mr-bjerre/hassio-remote-backup of @mr-bjerre, which creates and manages snapshots and has a SCP function. It is enhanced so that it is also able to transfer the Hass.io folders /addons, /backup, /config, /share and /ssl to a remote rsync server (e.g. a Synology NAS).
The addon transfers the changes to the destination at every start. After the transfer it stops.

You might want to start the transfer with a HASS automation
```
- id: '7'
  alias: Create snapshot & Folder sync to NAS
  trigger:
    platform: time
    at: '1:00:00'
  action:
  - service: hassio.addon_start
    data:
      addon: 36883ed7_remote_backup
```
