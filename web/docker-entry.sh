#!/bin/bash
echo Starting Nginx
sed -Ei "s/PLATFORM_ADDR/$SERVICE_HOST_ENV_NAME/" /etc/nginx/sites-available/proxyssl
sed -Ei "s/PLATFORM_PORT/$SERVICE_PORT_ENV_NAME/" /etc/nginx/sites-available/proxyssl
sed -Ei "s/REDIRECT_HOST/$REDIRECT_HOST_ENV_NAME/" /etc/nginx/sites-available/proxyssl

nginx -g 'daemon off;'
