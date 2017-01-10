## Contents

- [Connection](#connection)
- [Database](#database)
- [Table](#table)
- [User](#user)
- [Backup & Restore](#backup--restore)

<br />
***
<br />

## Connection

#### Connect
```sql
mysql -u root -p
```

#### Disconnect
```sql
exit;
```

<br />

## Database

#### List
```sql
SHOW DATABASES;
```

#### Create
```sql
CREATE DATABASE [IF NOT EXISTS] db_name [DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci];
```

#### Drop
```sql
DROP DATABASE [IF EXISTS] db_name;
```

<br />

## Table

#### Truncate
```sql
TRUNCATE table_name;
```

#### Drop
```sql
DROP TABLE table_name1, table_name2, table_name3;
```

<br />

## User

#### Create
```sql
CREATE USER db_user@localhost;
```

#### Drop
```sql
DROP USER db_user@localhost;
```

#### Set Password
```sql
SET PASSWORD FOR db_user@localhost= PASSWORD("secure_password");
```

#### Grant Privileges
```sql
GRANT ALL PRIVILEGES ON wordpress.* TO db_user@localhost IDENTIFIED BY 'secure_password';
```

#### Refresh Privileges
```sql
FLUSH PRIVILEGES;
```

<br />

## Backup & Restore

#### Backup
```sql
mysqldump -u user -p --opt database_name > db_backup.sql
```

#### Restore
```sql
mysql -u user -p database < ~/db_backup.sql
```
