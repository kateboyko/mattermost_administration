#!/bin/bash
source ../mattermost.config
expect -f ftp.sh $host $username $password
unzip -oq ./backup.zip -d /
rm ./backup.zip
