#!/bin/bash
apt update -y
apt install apache2 -y
echo "<h1>${server_text}</h1>" > /var/www/html/index.html
echo "<h2>Server port: ${server_port}</h2>" >> /var/www/html/index.html
echo "<h2>DB port: ${db_port}</h2>" >> /var/www/html/index.html
echo "<h2>DB address: ${db_address}</h2>" >> /var/www/html/index.html
systemctl start apache2
systemctl enable apache2