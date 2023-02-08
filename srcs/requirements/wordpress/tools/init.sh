#!/bin/bash

sleep 20

#Fill the wordpress config file with env var

sed -i s/vDB_HOST/$DB_HOST/g wp-config.php
sed -i s/vDB_NAME/$DB_NAME/g wp-config.php
sed -i s/vDB_USER/$DB_USER/g wp-config.php
sed -i s/vDB_PSWD/$DB_PSWD/g wp-config.php
sed -i s/vDB_CHARSET/$DB_CHARSET/g wp-config.php
sed -i s/vDB_COLLATE/$DB_COLLATE/g wp-config.php

#Runned as root : Download wordpress core in specified path

wp core download --allow-root --path=/var/www/html

#Copy previously imported file from host at correct location

cp wp-config.php /var/www/html

#Create the wordpress table and admin user in the database

wp core install --path=/var/www/html --url="$WP_ADMIN_USER.42.fr" --title="$WP_ADMIN_USER inception" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PSWD" --admin_email="$WP_ADMIN_USER@student.42lyon.fr" --allow-root

#Create the wordpres default user

wp user create --path=/var/www/html $WP_DEFAULT_USER "$WP_DEFAULT_USER"@randomuser.com --role='subscriber' --user_pass="$WP_DEFAULT_PSWD" --allow-root

#Run the interface php-fpm who allow communication betwen web serv and php

exec /usr/sbin/php-fpm7.3 -F
