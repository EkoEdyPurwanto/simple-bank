-- Explanation for Migration Down:
-- When undoing the changes made by the migration up, we need to reverse the order of operations.
-- Since foreign key constraints may depend on indexes, we begin by dropping the indexes associated with the tables.

-- Drop indexes first to avoid potential foreign key constraint issues during table deletion.
DROP INDEX IF EXISTS transfers_from_account_id_to_account_id_idx;
DROP INDEX IF EXISTS transfers_to_account_id_idx;
DROP INDEX IF EXISTS transfers_from_account_id_idx;
DROP INDEX IF EXISTS entries_account_id_idx;
DROP INDEX IF EXISTS accounts_owner_idx;

-- Next, we remove the foreign key constraints to allow for the tables' deletion.
-- The foreign key constraints between the 'transfers' and 'entries' tables referencing the 'accounts' table are dropped.
ALTER TABLE transfers DROP CONSTRAINT IF EXISTS transfers_to_account_id_fkey;
ALTER TABLE transfers DROP CONSTRAINT IF EXISTS transfers_from_account_id_fkey;
ALTER TABLE entries DROP CONSTRAINT IF EXISTS entries_accounts_id_fkey;

-- Finally, we can drop the tables in the reverse order of their creation, starting with the 'transfers' table, then 'entries', and finally 'accounts'.
-- Dropping the 'transfers' table first ensures we don't violate the foreign key constraints.
DROP TABLE IF EXISTS transfers;
DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS accounts;
