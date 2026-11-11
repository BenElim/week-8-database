-- ============================================================
-- MySQL Backup Assignment - answer.sql
-- Note: mysqldump is a command-line tool, not an SQL statement.
-- Run these commands in a terminal (not inside the mysql client).
-- ============================================================


-- ------------------------------------------------------------
-- Question 1: Complete backup of the `sales` database
-- ------------------------------------------------------------
-- mysqldump -u root -p sales > sales_backup.sql
--
-- Explanation:
--   mysqldump          MySQL utility that exports a database as SQL statements
--   -u root            connect as the root user
--   -p                 prompt for the password (keeps it out of shell history)
--   sales              the database to back up
--   > sales_backup.sql redirect the output into the file sales_backup.sql
--
-- Restore:
-- mysql -u root -p sales < sales_backup.sql
--
-- Why regular backups matter:
--   * Protect against data loss (hardware failure, accidental DROP/DELETE, corruption)
--   * Allow a rollback if a major change or migration goes wrong
--   * Support disaster recovery and business continuity
--   * Help meet compliance and audit requirements


-- ------------------------------------------------------------
-- Question 2: Backup of ALL databases on the server
-- ------------------------------------------------------------
-- mysqldump -u root -p --all-databases > all_databases_backup.sql
--
-- Explanation:
--   --all-databases    export every database on the server, including `sales`
--   -u root            connect as the root user
--   -p                 prompt for the password
--   > all_databases_backup.sql  save the output to this file
--
-- Restore:
-- mysql -u root -p < all_databases_backup.sql
--
-- Why back up all databases before a server migration:
--   * Nothing is left behind when the old server is retired
--   * Includes the `mysql` system database (users and privileges)
--   * Gives a rollback option if the new server has problems
--   * Provides one consistent snapshot of all data
--   * Lets you verify the migrated data against the backup


-- ------------------------------------------------------------
-- Optional improvements
-- ------------------------------------------------------------
-- mysqldump -u root -p --single-transaction --routines --triggers --events sales > sales_backup.sql
-- mysqldump -u root -p --all-databases --single-transaction --routines --triggers --events > all_databases_backup.sql
