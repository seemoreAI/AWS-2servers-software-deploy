#!/bin/bash
# Enable logging for debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting Web server provisioning..."

# Update and install Apache, PHP, and PHP MySQL extension
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y apache2 php libapache2-mod-php php-mysql

# Enable Apache rewrite module and restart Apache service
a2enmod rewrite
systemctl enable apache2
systemctl restart apache2

echo "Web base packages installed."
