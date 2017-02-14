#!/bin/bash
docker run --name mattermost-mysql -d  --env "MYSQL_USER=mattermost" --env "MYSQL_PASSWORD=password" --env 'MYSQL_DATABASE=mattermost' --env "MYSQL_ROOT_PASSWORD=password" --volume /srv/docker/mattermost/mysql:/var/lib/mysql mysql:latest
#3.6.3
docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" "mattermost" ./bin/platform -config /opt/mattermost/config/config.json
#3.5.1
#docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" "jasl8r/mattermost:latest" ./bin/platform -config /opt/mattermost/config/config.json
docker ps -a
