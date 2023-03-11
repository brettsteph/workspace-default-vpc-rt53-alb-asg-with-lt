#!/bin/bash

sudo apt update -y
sudo apt install -y apache2
sudo mv /var/www/html/index.html > /var/www/html/backup_index.html
EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo '<center><h1>AWS EC2 Instance is located in Availability Zone: AZID</h1></center>' > /var/www/html/index.txt
sed "s/AZID/$EC2AZ/" /var/www/html/index.txt > /var/www/html/index.html