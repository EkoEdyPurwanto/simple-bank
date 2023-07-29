1. #### create database schema
![simple bank schema](https://github.com/EchoEdyP/simple-bank/blob/main/simple-bank-schema.png)

2. #### setup database on docker:
    - pull database from docker hub = docker pull postgres:15.3-alpine3.18
    - run database images = sudo docker run --name postgres15.3 -p 9876:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1903 -d postgres:15.3-alpine3.18
    - login to database = sudo docker exec -it postgres15.3 psql -U root
    - create database = create database simple_bank owner root;
    - import file .sql to simple_bank database
   
3. #### You can also perform database migration without doing it manually (as in point number 2).
```bash
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```
and using [Makefile](https://github.com/EchoEdyP/simple-bank/blob/main/Makefile) for simplify execution

4. #### install [SQLC](https://sqlc.dev/)

5. #### implements SQLC:
    - cd /to/your/path/project
    - initialize SQLC:
    ```bash
    sqlc init
    ```
    - set config sqlc.yaml

6. #### implements [query.sql](https://github.com/EchoEdyP/simple-bank/tree/main/db/query) to generate what do you want 😁