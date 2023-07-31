-- Explanation for Migration Up:
-- This migration script is designed to create the necessary tables and set up the schema for the database.

-- We begin by creating the 'accounts' table, which will store information about user accounts.
CREATE TABLE accounts (
                          id bigserial PRIMARY KEY,
                          owner varchar NOT NULL,
                          balance bigint NOT NULL,
                          currency varchar NOT NULL,
                          created_at timestamp NOT NULL DEFAULT NOW()
);

-- Next, we create the 'entries' table, which will hold transaction records related to user accounts.
-- This table has a foreign key constraint referencing the 'id' column of the 'accounts' table.
CREATE TABLE entries (
                         id bigserial PRIMARY KEY,
                         account_id bigint NOT NULL,
                         amount bigint NOT NULL,
                         created_at timestamp NOT NULL DEFAULT NOW(),
                         FOREIGN KEY (account_id) REFERENCES accounts (id)
);

-- Then, we create the 'transfers' table, which will represent the transfer transactions between accounts.
-- This table has foreign key constraints referencing the 'id' column of the 'accounts' table twice for 'from_account_id' and 'to_account_id'.
-- The 'amount' column is checked to ensure it is always positive using the 'CHECK' constraint.
CREATE TABLE transfers (
                           id bigserial PRIMARY KEY,
                           from_account_id bigint NOT NULL,
                           to_account_id bigint NOT NULL,
                           amount bigint NOT NULL CHECK (amount > 0),
                           created_at timestamp NOT NULL DEFAULT NOW(),
                           FOREIGN KEY (from_account_id) REFERENCES accounts (id),
                           FOREIGN KEY (to_account_id) REFERENCES accounts (id)
);

-- We create several indexes to improve query performance on frequently accessed columns.
CREATE INDEX ON accounts (owner);
CREATE INDEX ON entries (account_id);
CREATE INDEX ON transfers (from_account_id);
CREATE INDEX ON transfers (to_account_id);
CREATE INDEX ON transfers (from_account_id, to_account_id);

-- We add comments to explain the meaning and constraints of certain columns for future reference.
COMMENT ON COLUMN entries.amount IS 'Can be negative or positive.';
COMMENT ON COLUMN transfers.amount IS 'Must be positive.';
