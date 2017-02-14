#!/bin/bash
source ./mattermost.config
apt-get upgrade
sudo apt-get install -y mc zip unzip expect git curl
SECRET_KEY=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1)
LINK_SALT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1)
RESET_SALT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1)
INVITE_SALT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 34 | head -n 1)
docker run --name mattermost-mysql -d  --env "MYSQL_USER=mattermost" --env "MYSQL_PASSWORD=password" --env 'MYSQL_DATABASE=mattermost' --env "MYSQL_ROOT_PASSWORD=password" --volume /srv/docker/mattermost/mysql:/var/lib/mysql mysql:latest
#version 3.6.2
git clone https://github.com/funkyfuture/docker-mattermost.git
cd docker-mattermost; git checkout update_to_3.6.2; git pull; docker build -t "mattermost" .
docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --env "MATTERMOST_EMAIL=$MATTERMOST_EMAIL" --env "SMTP_SECURITY=$SMTP_SECURITY" --env "SMTP_HOST=$SMTP_HOST" --env "SMTP_USER=$SMTP_USER" --env "SMTP_PASS=$SMTP_PASS"  --env "SMTP_PORT=$SMTP_PORT" --env "MATTERMOST_SECRET_KEY=$SECRET_KEY" --env "MATTERMOST_LINK_SALT=$LINK_SALT" --env "MATTERMOST_RESET_SALT=$RESET_SALT"  --env "MATTERMOST_INVITE_SALT=$INVITE_SALT" --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" "mattermost"
#version 3.5.1
#docker pull jasl8r/mattermost:latest
#docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --env "MATTERMOST_EMAIL=$MATTERMOST_EMAIL" --env "SMTP_SECURITY=$SMTP_SECURITY" --env "SMTP_HOST=$SMTP_HOST" --env "SMTP_USER=$SMTP_USER" --env "SMTP_PASS=$SMTP_PASS"  --env "SMTP_PORT=$SMTP_PORT" --env "MATTERMOST_SECRET_KEY=$SECRET_KEY" --env "MATTERMOST_LINK_SALT=$LINK_SALT" --env "MATTERMOST_RESET_SALT=$RESET_SALT"  --env "MATTERMOST_INVITE_SALT=$INVITE_SALT" --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" "jasl8r/mattermost:latest"
docker ps -a
