WEBHOOK_TEAMS=${WEBHOOK_TEAMS//\"/ }
WEBHOOK_TEAMS=${WEBHOOK_TEAMS//\//\\\/}

sed -i "s/teamswebhook/$WEBHOOK_TEAMS/" /etc/prom2teams/config.ini

prom2teams --configpath /etc/prom2teams/config.ini