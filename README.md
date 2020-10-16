```
$ cd 01-joins
```

In order to (a) create a database file,
(b) add tables to it, and (c) insert data into those tables,
issue only one of the following commands:
```
$ cat 1_create_database.sql | sqlite3 Test.db
$ sqlite3 Test.db ".read 1_create_database.sql"
$ sqlite3 Test.db < 1_create_database.sql
```

```
$ sqlite3 Test.db
sqlite> .mode columns
sqlite> .headers on
```