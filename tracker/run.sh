#!/bin/sh
sleep 5
echo "db_dsn = DBI:mysql:mogilefs:host=$DB_1_PORT_3306_TCP_ADDR" >> mogilefsd.conf
mogdbsetup --yes --dbhost=$DB_1_PORT_3306_TCP_ADDR --dbname=mogilefs --dbuser=root --dbpassword=''
useradd -g nogroup -s /bin/false -d /var/mogdata mogilefs
sudo -u mogilefs mogilefsd -c mogilefsd.conf
sleep 5
mogadm host add stored --ip=$NODE_1_PORT_7500_TCP_ADDR --port=7500 --status=alive
mogadm check
tail -f /dev/null
