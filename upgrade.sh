#!/bin/bash
docker stop mattermost mattermost-mysql
docker rm mattermost mattermost-mysql
cd ./backup; ./backup.sh
./deploy.sh
