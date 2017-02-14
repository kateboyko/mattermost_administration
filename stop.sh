#!/bin/bash
cd ./backup; ./backup.sh
docker stop mattermost mattermost-mysql
docker rm mattermost mattermost-mysql
