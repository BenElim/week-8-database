# MySQL Backup Assignment

This repository contains my answers for the MySQL backup assignment, using the `sales` database.

## Files

| File | Description |
|------|-------------|
| `answer.sql` | The `mysqldump` commands and explanations for both questions |
| `README.md` | This file: overview, explanations, and how to run the commands |

## Question 1: Backup of the `sales` database

```bash
mysqldump -u root -p sales > sales_backup.sql
```

### What it does

- `mysqldump` is MySQL's logical backup utility. It exports a database as SQL statements (`CREATE TABLE`, `INSERT INTO`, and so on) that can rebuild it.
- `-u root` connects as the `root` user.
- `-p` prompts for the password, so it is not typed in the command or saved in shell history.
- `sales` is the database being backed up.
- `> sales_backup.sql` saves the output into the file `sales_backup.sql`.

### Restore

```bash
mysql -u root -p sales < sales_backup.sql
```

### Why regular backups are important

- **Protection against data loss:** hardware failure, accidental `DROP` or `DELETE` statements, corruption, or a bad update can destroy data.
- **Safety before major changes:** if a schema change or migration goes wrong, the database can be rolled back.
- **Disaster recovery:** a backup is the last line of defence against crashes, ransomware, and human error.
- **Business continuity:** losing sales records would be costly. Regular backups keep downtime and data loss small.
- **Compliance and auditing:** many organisations must keep historical copies of their data.

## Question 2: Backup of all databases

```bash
mysqldump -u root -p --all-databases > all_databases_backup.sql
```

### What it does

- `--all-databases` exports every database on the server, including `sales`, in one file.
- `-u root` connects as `root`.
- `-p` prompts for the password.
- `> all_databases_backup.sql` saves the output to that file.

### Restore

```bash
mysql -u root -p < all_databases_backup.sql
```

### Why back up everything before a server migration

- **Nothing is left behind:** a forgotten database is lost once the old server is retired.
- **System data is included:** the `mysql` system database holds user accounts and privileges, so there is no need to recreate them by hand.
- **Rollback safety net:** if the new server has compatibility or configuration problems, the original data is still available.
- **Consistency:** one backup taken at one point in time keeps related databases in sync.
- **Verification:** the migrated server can be checked against the backup to confirm everything arrived intact.

## Optional improvements

```bash
mysqldump -u root -p --single-transaction --routines --triggers --events sales > sales_backup.sql
```

- `--single-transaction` gives a consistent backup of InnoDB tables without locking them.
- `--routines --triggers --events` includes stored procedures, triggers, and scheduled events.

## How to run

1. Open a terminal (not the `mysql>` prompt).
2. Run the command.
3. Enter the `root` password when prompted.
4. Check that the backup file was created:

```bash
ls -lh sales_backup.sql all_databases_backup.sql
```

## Author

Elim Benjamin
