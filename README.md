### Create Database Schema

![Simple Bank Schema](https://github.com/EchoEdyP/simple-bank/blob/main/simple-bank-schema.png)

### Setup Database & Perform Database Migration on Docker (manually)

1. Pull the database from Docker Hub:
```bash
docker pull postgres:15.3-alpine3.18
```

2. Run the database container:
```bash
sudo docker run --name postgres15.3 -p 9876:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1903 -d postgres:15.3-alpine3.18
```

3. Login to the database:
```bash
sudo docker exec -it postgres15.3 psql -U root
```

4. Create the `simple_bank` database:
```sql
CREATE DATABASE simple_bank OWNER root;
```

5. Import the `.sql` file into the `simple_bank` database.

### Setup Database & Perform Database Migration on Docker (automatically)

You can also perform database migration automatically without doing it manually using [Go Database migrations](https://github.com/golang-migrate/migrate). First, make sure you have pulled the appropriate database image:

```bash
docker pull postgres:15.3-alpine3.18
```

Then, install the required library for Go Database migrations:

```bash
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

Use the provided [Makefile](https://github.com/EchoEdyP/simple-bank/blob/main/Makefile) to simplify execution.

### Install SQLC and Go Postgres Driver

1. Install [SQLC](https://sqlc.dev/).

2. Install [Go Postgres driver for database/sql](https://github.com/lib/pq).

### Implement SQLC:

1. Change directory to your project path:
```bash
cd /to/your/path/project
```

2. Initialize SQLC:
```bash
sqlc init
```

3. Set the configuration in `sqlc.yaml`.

### Implement query.sql

Implement your desired queries in the [query.sql](https://github.com/EchoEdyP/simple-bank/tree/main/db/query) file.

### Implement Unit Tests for query.sql

1. Install [testify](https://github.com/stretchr/testify) for testing.

2. Implement [main_test.go](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/main_test.go) to connect to the database.

3. Implement [account_test.go](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/account_test.go), [entry_test.go](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/entry_test.go), [transfer_test](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/transfer_test.go) to test the functions.

4. Additionally, you can use [random_generate.go](https://github.com/EchoEdyP/simple-bank/blob/main/utils/random-generate.go) to generate random data for testing purposes.