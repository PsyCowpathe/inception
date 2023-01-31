#!/bin/bash

mysqld_safe &

sleep 3

/usr/bin/mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
/usr/bin/mysql -uroot -e "GRANT ALL ON $DB_NAME .* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PSWD';"
/usr/bin/mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PSWD';"

mysqladmin -uroot -p$DB_ROOT_PSWD shutdown

/usr/sbin/mysqld
