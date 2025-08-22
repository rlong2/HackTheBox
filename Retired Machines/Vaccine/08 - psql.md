After SSHing as the `postgres` user, the postgres database can be inspected.
- ssh credentials
	- postgres
	- P@s5w0rd!

```
postgres@vaccine:/tmp/ignore$ psql -U postgres
psql (11.7 (Ubuntu 11.7-0ubuntu0.19.10.1))
Type "help" for help.

postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 carsdb    | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
(4 rows)


postgres=# \c carsdb
You are now connected to database "carsdb" as user "postgres".
carsdb=# \dt
        List of relations
 Schema | Name | Type  |  Owner   
--------+------+-------+----------
 public | cars | table | postgres
(1 row)

                                     Table "public.cars"
  Column  |          Type          | Collation | Nullable |             Default              
----------+------------------------+-----------+----------+----------------------------------
 id       | integer                |           | not null | nextval('cars_id_seq'::regclass)
 name     | character varying(100) |           | not null | 
 type     | character varying(100) |           | not null | 
 fueltype | character varying(100) |           | not null | 
 engine   | character varying(100) |           | not null | 
Indexes:
    "cars_pkey" PRIMARY KEY, btree (id)


```