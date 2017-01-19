## Contents

- [Connection](#connection)
- [Database](#database)

<br />
***
<br />

## Connection

#### Connect
```bash
mongo --host mongodb.example.com --port 27017
```

To use a specific database (i.e `dbName`)
```bash
mongo --host mongodb.example.com --port 27017 dbName
```

Specify a username and password with which to authenticate to a MongoDB database that uses authentication.
```bash
mongo --host mongodb.example.com --port 27017 -u admin -p securePass
```

To force mongo to prompt for a password, enter the `--password` (`-p`) option as the last option and leave out the argument.
```bash
mongo --host mongodb.example.com --port 27017 -u admin -p
```

To execute a JavaScript file (`input.js`) and save the result as a file (`output`)
```bash
mongo --host mongodb.example.com --port 27017 input.js > output
```

#### Disconnect
```bash
exit
```

<br />

## Database

#### List
```bash
show dbs
```

#### Current Database

To display the database you are using (The operation should return `test`, which is the default database)
```bash
db
```

#### Switch Database

To switch databases
```bash
use dbName
```
