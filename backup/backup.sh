#!/bin/bash
zip -rq backup /srv/docker/mattermost
source ../mattermost.config
expect -f ftp.sh $host $username $password
rm backup.zip
