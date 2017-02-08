#!/bin/bash
source ../mattermost.config
expect -f ftp.sh $host $username $password
unzip -o ../backup/backup.zip -d /
rm backup.zip
