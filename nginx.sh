#!/bin/bash

sudo cp server_ssl /usr/local/etc/nginx/servers

sudo cp server.key /usr/local/etc/nginx/keys
sudo cp server.crt /usr/local/etc/nginx/keys

sudo nginx -s reload