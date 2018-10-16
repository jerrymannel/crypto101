#!/bin/bash

rm README.md.enc
rm README.md.out
rm ca.crt
rm ca.csr
rm ca.key
rm index.txt
rm index.txt.attr
rm index.txt.attr.old
rm index.txt.old
rm key.bin
rm key.bin.enc
rm key.bin.out
rm serial.txt
rm serial.txt.old
rm server.crt
rm server.csr
rm server.key
rm server.pub.pem
rm server_ca.crt
rm server_ca_1.crt

rm 0*

sudo rm /usr/local/etc/nginx/servers/server_ssl 

sudo rm /usr/local/etc/nginx/keys/*

sudo nginx -s reload

touch index.txt
echo '01' > serial.txt