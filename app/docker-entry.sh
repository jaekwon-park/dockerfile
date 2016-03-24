#!/bin/bash
config=/mattermost/config/config.json
echo -ne "Configure database connection..."
if [ ! -f $config ]
then
    cp /config.template.json $config
    sed -Ei "s/MYSQL_USER/$MYSQL_USER/" $config
    sed -Ei "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/" $config
    sed -Ei "s/MYSQL_DATABASE/$MYSQL_DATABASE/" $config
    sed -Ei "s/MYSQL_HOST/$MYSQL_HOST/" $config
    echo OK
else
    echo SKIP
fi

#echo "Wait until database is ready..."
#until nc -z db $DB_PORT_5432_TCP_PORT
#do
#    sleep 1
#done

# Wait to avoid "panic: Failed to open sql connection pq: the database system is starting up"
sleep 1

echo "Starting platform"
cd /mattermost/bin
./platform
