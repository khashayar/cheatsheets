-- CONNECT
mysql -u root -p


-- DB: LIST
SHOW DATABASES;

-- DB: CREATE
CREATE DATABASE [IF NOT EXISTS] db_name [DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci];

-- DB: DROP
DROP DATABASE [IF EXISTS] db_name;


-- TABLE: TRUNCATE
TRUNCATE table_name;

-- TABLE: DROP
DROP TABLE table_name1, table_name2, table_name3;


-- USER: CREATE
CREATE USER db_user@localhost;

-- USER: DROP
DROP USER db_user@localhost;

-- USER: SET PASSWORD
SET PASSWORD FOR db_user@localhost= PASSWORD("secure_password");

-- USER: GRANT PRIVILEGES
GRANT ALL PRIVILEGES ON wordpress.* TO db_user@localhost IDENTIFIED BY 'secure_password';

-- USER: REFRESH PRIVILEGES
FLUSH PRIVILEGES;


-- EXIT
exit;


-- BACKUP
mysqldump -u user -p --opt database_name > db_backup.sql

-- RESTORE
mysql -u user -p database < ~/db_backup.sql
