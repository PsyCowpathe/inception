#!/bin/bash

#Start mysqld in safe mode meaning that it will restart in case of error

mysqld_safe &

#Waiting for previous command to finish execution

sleep 5

#Start mysql command line as root then create the database and enable unicode.
#Collate is used to sort and provide some specific properties to the database

/usr/bin/mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"

#Provide all privilege to user on all db and create this user, yeah ... in that order its kinda weird

/usr/bin/mysql -uroot -e "GRANT ALL ON $DB_NAME .* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PSWD';"

#Setup the password for root user

/usr/bin/mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PSWD';"

#Using root user to shutdown the database

mysqladmin -uroot -p$DB_ROOT_PSWD shutdown

#Run the database 

/usr/sbin/mysqld
