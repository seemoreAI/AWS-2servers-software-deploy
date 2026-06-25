#!/bin/bash
# Enable logging for debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting DB provisioning..."

# Update and install MariaDB
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y mariadb-server

# Allow MariaDB to accept connections from all IP addresses
# (security group will restrict actual access)
CNF_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"
if [ -f "$CNF_FILE" ]; then
    sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' "$CNF_FILE"
else
    # Fallback if config is in a different file
    sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/my.cnf
fi

# Enable and restart MariaDB service
systemctl enable mariadb
systemctl restart mariadb

echo "DB base packages installed and configured."
