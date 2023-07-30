1. #### create database schema
![simple bank schema](https://github.com/EchoEdyP/simple-bank/blob/main/simple-bank-schema.png)

2. #### setup database on docker:
    - pull database from docker hub = docker pull postgres:15.3-alpine3.18
    - run database images = sudo docker run --name postgres15.3 -p 9876:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1903 -d postgres:15.3-alpine3.18
    - login to database = sudo docker exec -it postgres15.3 psql -U root
    - create database = create database simple_bank owner root;
    - import file .sql to simple_bank database
   
3. #### You can also perform database migration without doing it manually (as in point number 2) but you still do: ```pull database from docker hub```  ⤵️
```bash
docker pull postgres:15.3-alpine3.18
```

```install library for```[Go Database migrations](https://github.com/golang-migrate/migrate) ⤵️
```bash
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```
and using [Makefile](https://github.com/EchoEdyP/simple-bank/blob/main/Makefile) for simplify execution

4. #### install [SQLC](https://sqlc.dev/) and also [Go Postgres driver for database/sql](https://github.com/lib/pq)

5. #### implements SQLC:
    - cd /to/your/path/project
    - initialize SQLC:
    ```bash
    sqlc init
    ```
    - set config sqlc.yaml

6. #### implements [query.sql](https://github.com/EchoEdyP/simple-bank/tree/main/db/query) to generate what do you want 😁

7. #### implements unit tests for this [query.sql](https://github.com/EchoEdyP/simple-bank/tree/main/db/query) file
    - install [testify](https://github.com/stretchr/testify)
    - implement [main_test.go](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/main_test.go) to connect DB
    - implement [account_test.go](https://github.com/EchoEdyP/simple-bank/blob/main/db/sqlc/account_test.go) for test the func and also [random_generate.go](https://github.com/EchoEdyP/simple-bank/blob/main/utils/random-generate.go) for generate random data