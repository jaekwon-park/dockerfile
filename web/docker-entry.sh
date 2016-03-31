#!/bin/bash
echo Starting Nginx
sed -Ei "s/PLATFORM_ADDR/$SERVICE_HOST_ENV_NAME/" /etc/nginx/sites-available/rocketchat
sed -Ei "s/PLATFORM_PORT/$SERVICE_PORT_ENV_NAME/" /etc/nginx/sites-available/rocketchat
nginx -g 'daemon off;'
