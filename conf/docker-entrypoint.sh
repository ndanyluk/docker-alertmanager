#!/bin/sh -e

cat /etc/alertmanager/alertmanager.yml |\
    sed "s@#user_key: <user_key>#@user_key: '$PUSHOVER_USER'@g" |\
    sed "s@#token: <api_token>#@token: '$PUSHOVER_TOKEN'@g" > /tmp/alertmanager.yml

mv /tmp/alertmanager.yml /etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
