#!/bin/bash
source ./mattermost.config
docker run --name mattermost-mysql -d  --env "MYSQL_USER=mattermost" --env "MYSQL_PASSWORD=password" --env 'MYSQL_DATABASE=mattermost' --env "MYSQL_ROOT_PASSWORD=password" --volume /srv/docker/mattermost/mysql:/var/lib/mysql mysql:latest
docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --env "MATTERMOST_EMAIL=$MATTERMOST_EMAIL" --env "SMTP_SECURITY=$SMTP_SECURITY" --env "SMTP_HOST=$SMTP_SECURITY" --env "SMTP_USER=$SMTP_USER" --env "SMTP_PASS=$SMTP_PASS"  --env "SMTP_PORT=$SMTP_PORT" --env "MATTERMOST_SECRET_KEY=$SECRET_KEY" --env "MATTERMOST_LINK_SALT=$LINK_SALT" --env "MATTERMOST_RESET_SALT=$RESET_SALT"  --env "MATTERMOST_INVITE_SALT=$INVITE_SALT" --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" "jasl8r/mattermost:latest" ./bin/platform -config /opt/mattermost/config/config.json
docker ps -a
