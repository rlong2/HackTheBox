# Looking through the databases

### Process:

| command                    | result                               |
| -------------------------- | ------------------------------------ |
| SHOW DATABASES;            | show the databases available         |
| USE {the database};        | change to that database              |
| SHOW tables;               | display tables in that database      |
| SELECT * FROM {the table}; | display the info stored in the table |

```
MariaDB [(none)]> show DATABASES;
+--------------------+
| Database           |
+--------------------+
| htb                |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.053 sec)
```

## Inspecting htb database
It makes sense to start with this database since it is unique. information_schema, mysql, and performance_schema are common to MySql servers.
```
MariaDB [(none)]> use htb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [htb]> show tables;
+---------------+
| Tables_in_htb |
+---------------+
| config        |
| users         |
+---------------+
2 rows in set (0.051 sec)

MariaDB [(none)]> use htb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [htb]> show tables;
+---------------+
| Tables_in_htb |
+---------------+
| config        |
| users         |
+---------------+
2 rows in set (0.051 sec)

MariaDB [htb]> select * from config;
+----+-----------------------+----------------------------------+
| id | name                  | value                            |
+----+-----------------------+----------------------------------+
|  1 | timeout               | 60s                              |
|  2 | security              | default                          |
|  3 | auto_logon            | false                            |
|  4 | max_size              | 2M                               |
|  5 | flag                  | 7b4bec00d1a39e3dd4e021ec3d915da8 |
|  6 | enable_uploads        | false                            |
|  7 | authentication_method | radius                           |
+----+-----------------------+----------------------------------+
7 rows in set (0.049 sec)

```

Got the flag, checking out the remaining databases
## Inspecting information_schema database
```
MariaDB [htb]> use information_schema;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [information_schema]> show tables;
+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| ALL_PLUGINS                           |
| APPLICABLE_ROLES                      |
| CHARACTER_SETS                        |
| CHECK_CONSTRAINTS                     |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMN_PRIVILEGES                     |
| ENABLED_ROLES                         |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| GLOBAL_STATUS                         |
| GLOBAL_VARIABLES                      |
| KEY_CACHES                            |
| KEY_COLUMN_USAGE                      |
| PARAMETERS                            |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMA_PRIVILEGES                     |
| SESSION_STATUS                        |
| SESSION_VARIABLES                     |
| STATISTICS                            |
| SYSTEM_VARIABLES                      |
| TABLES                                |
| TABLESPACES                           |
| TABLE_CONSTRAINTS                     |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
| USER_PRIVILEGES                       |
| VIEWS                                 |
| GEOMETRY_COLUMNS                      |
| SPATIAL_REF_SYS                       |
| CLIENT_STATISTICS                     |
| INDEX_STATISTICS                      |
| INNODB_SYS_DATAFILES                  |
| USER_STATISTICS                       |
| INNODB_SYS_TABLESTATS                 |
| INNODB_LOCKS                          |
| INNODB_MUTEXES                        |
| INNODB_CMPMEM                         |
| INNODB_CMP_PER_INDEX                  |
| INNODB_CMP                            |
| INNODB_FT_DELETED                     |
| INNODB_CMP_RESET                      |
| INNODB_LOCK_WAITS                     |
| TABLE_STATISTICS                      |
| INNODB_TABLESPACES_ENCRYPTION         |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_SYS_FIELDS                     |
| INNODB_CMPMEM_RESET                   |
| INNODB_SYS_COLUMNS                    |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_CMP_PER_INDEX_RESET            |
| user_variables                        |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_SYS_FOREIGN_COLS               |
| INNODB_FT_BEING_DELETED               |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_TRX                            |
| INNODB_SYS_FOREIGN                    |
| INNODB_SYS_TABLES                     |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_FT_CONFIG                      |
| INNODB_BUFFER_PAGE                    |
| INNODB_SYS_TABLESPACES                |
| INNODB_METRICS                        |
| INNODB_SYS_INDEXES                    |
| INNODB_SYS_VIRTUAL                    |
| INNODB_TABLESPACES_SCRUBBING          |
| INNODB_SYS_SEMAPHORE_WAITS            |
+---------------------------------------+
76 rows in set (0.052 sec)

MariaDB [information_schema]> select * from user_variables;
Empty set (0.051 sec)

MariaDB [information_schema]> select * from USER_PRIVILEGES;
+------------+---------------+-------------------------+--------------+
| GRANTEE    | TABLE_CATALOG | PRIVILEGE_TYPE          | IS_GRANTABLE |
+------------+---------------+-------------------------+--------------+
| 'root'@'%' | def           | SELECT                  | YES          |
| 'root'@'%' | def           | INSERT                  | YES          |
| 'root'@'%' | def           | UPDATE                  | YES          |
| 'root'@'%' | def           | DELETE                  | YES          |
| 'root'@'%' | def           | CREATE                  | YES          |
| 'root'@'%' | def           | DROP                    | YES          |
| 'root'@'%' | def           | RELOAD                  | YES          |
| 'root'@'%' | def           | SHUTDOWN                | YES          |
| 'root'@'%' | def           | PROCESS                 | YES          |
| 'root'@'%' | def           | FILE                    | YES          |
| 'root'@'%' | def           | REFERENCES              | YES          |
| 'root'@'%' | def           | INDEX                   | YES          |
| 'root'@'%' | def           | ALTER                   | YES          |
| 'root'@'%' | def           | SHOW DATABASES          | YES          |
| 'root'@'%' | def           | SUPER                   | YES          |
| 'root'@'%' | def           | CREATE TEMPORARY TABLES | YES          |
| 'root'@'%' | def           | LOCK TABLES             | YES          |
| 'root'@'%' | def           | EXECUTE                 | YES          |
| 'root'@'%' | def           | REPLICATION SLAVE       | YES          |
| 'root'@'%' | def           | REPLICATION CLIENT      | YES          |
| 'root'@'%' | def           | CREATE VIEW             | YES          |
| 'root'@'%' | def           | SHOW VIEW               | YES          |
| 'root'@'%' | def           | CREATE ROUTINE          | YES          |
| 'root'@'%' | def           | ALTER ROUTINE           | YES          |
| 'root'@'%' | def           | CREATE USER             | YES          |
| 'root'@'%' | def           | EVENT                   | YES          |
| 'root'@'%' | def           | TRIGGER                 | YES          |
| 'root'@'%' | def           | CREATE TABLESPACE       | YES          |
| 'root'@'%' | def           | DELETE HISTORY          | YES          |
+------------+---------------+-------------------------+--------------+
29 rows in set (0.051 sec)

```
Interesting, but too much to sort through

## Inspecting mysql database
```
MariaDB [information_schema]> use mysql
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [mysql]> show tables;
+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| column_stats              |
| columns_priv              |
| db                        |
| event                     |
| func                      |
| general_log               |
| gtid_slave_pos            |
| help_category             |
| help_keyword              |
| help_relation             |
| help_topic                |
| host                      |
| index_stats               |
| innodb_index_stats        |
| innodb_table_stats        |
| plugin                    |
| proc                      |
| procs_priv                |
| proxies_priv              |
| roles_mapping             |
| servers                   |
| slow_log                  |
| table_stats               |
| tables_priv               |
| time_zone                 |
| time_zone_leap_second     |
| time_zone_name            |
| time_zone_transition      |
| time_zone_transition_type |
| transaction_registry      |
| user                      |
+---------------------------+
31 rows in set (0.050 sec)

```
Not much here either.

## Inspecting performance_schema database
```
Database changed
MariaDB [performance_schema]> show tables;
+----------------------------------------------------+
| Tables_in_performance_schema                       |
+----------------------------------------------------+
| accounts                                           |
| cond_instances                                     |
| events_stages_current                              |
| events_stages_history                              |
| events_stages_history_long                         |
| events_stages_summary_by_account_by_event_name     |
| events_stages_summary_by_host_by_event_name        |
| events_stages_summary_by_thread_by_event_name      |
| events_stages_summary_by_user_by_event_name        |
| events_stages_summary_global_by_event_name         |
| events_statements_current                          |
| events_statements_history                          |
| events_statements_history_long                     |
| events_statements_summary_by_account_by_event_name |
| events_statements_summary_by_digest                |
| events_statements_summary_by_host_by_event_name    |
| events_statements_summary_by_thread_by_event_name  |
| events_statements_summary_by_user_by_event_name    |
| events_statements_summary_global_by_event_name     |
| events_waits_current                               |
| events_waits_history                               |
| events_waits_history_long                          |
| events_waits_summary_by_account_by_event_name      |
| events_waits_summary_by_host_by_event_name         |
| events_waits_summary_by_instance                   |
| events_waits_summary_by_thread_by_event_name       |
| events_waits_summary_by_user_by_event_name         |
| events_waits_summary_global_by_event_name          |
| file_instances                                     |
| file_summary_by_event_name                         |
| file_summary_by_instance                           |
| host_cache                                         |
| hosts                                              |
| mutex_instances                                    |
| objects_summary_global_by_type                     |
| performance_timers                                 |
| rwlock_instances                                   |
| session_account_connect_attrs                      |
| session_connect_attrs                              |
| setup_actors                                       |
| setup_consumers                                    |
| setup_instruments                                  |
| setup_objects                                      |
| setup_timers                                       |
| socket_instances                                   |
| socket_summary_by_event_name                       |
| socket_summary_by_instance                         |
| table_io_waits_summary_by_index_usage              |
| table_io_waits_summary_by_table                    |
| table_lock_waits_summary_by_table                  |
| threads                                            |
| users                                              |
+----------------------------------------------------+
52 rows in set (0.049 sec)

MariaDB [performance_schema]> select * from users;
Empty set (0.054 sec)

```
Not much here.
# flag.txt
```
See 'Inspecting htb database' above :)
```