#!/bin/bash
apt update -y
apt install apache2 -y
echo "Hello, World" > /var/www/html/index.html
echo "Server port: ${server_port}" >> /var/www/html/index.html
echo "DB port: ${db_port}" >> /var/www/html/index.html
echo "DB address: ${db_address}" >> /var/www/html/index.html
systemctl start apache2
systemctl enable apache2