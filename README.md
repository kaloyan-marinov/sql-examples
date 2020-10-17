# Instructions

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

One by one, use the SQLite prompt to execute each command from the
`01-joins/2_commands.sql` file.

# Resources

1. https://www.sqlitetutorial.net/sqlite-foreign-key/
2. https://www.sqlite.org/faq.html#q1
  (led to by https://stackoverflow.com/questions/4042848/error-in-near-autoincrement)
3. https://en.wikipedia.org/wiki/Join_%28SQL%29
4. https://database.guide/5-ways-to-run-sql-script-from-file-sqlite/
