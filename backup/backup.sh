#!/bin/bash
zip -r backup.zip /srv/docker/mattermost
source ../mattermost.config
expect -f ftp.sh $host $username $password
rm backup.zip
