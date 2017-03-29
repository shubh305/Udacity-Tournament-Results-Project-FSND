## Udacity Tournament Results
Tournament Results Project in the Udacity Full stack nanodegree using Python and PostgreSQL.

Instructions to run the project :-

* Clone the repository.

* Start vagrant and be migrate to the the project directory.

* To initialize the required tables, run: 

  ```
  $ psql
  ```
  ```
  $ \i tournament.sql
  ```

* Then quit **PostgreSQL** with `\q` and then run:

  ```
  $ python tournament_test.py
  ```
