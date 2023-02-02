CREATE DATABASE IF NOT EXISTS DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci

CREATE USER IF NOT EXISTS 'DB_USER'@'localhost' IDENTIFIED BY 'DB_PSWD';
GRANT ALL PRIVILEGES ON DB_NAME.* TO 'DB_USER'@'localhost' IDENTIFIED BY 'DB_PSWD';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'DB_ROOT_PSWD';
