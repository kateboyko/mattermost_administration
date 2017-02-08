#!/bin/bash
zip -r backup.zip /srv/docker/mattermost
expect -f ftp.sh
