#!/bin/bash
zip -rq backup /srv/docker/mattermost/mattermost /srv/docker/mattermost/config
source ../mattermost.config
expect -f ftp.sh $host $username $password
rm backup.zip
