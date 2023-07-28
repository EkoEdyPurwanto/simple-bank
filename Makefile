pull-db-images:
	docker pull postgres:15.3-alpine3.18

run-postgres:
	sudo docker run --name postgres15.3 -p 9876:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1903 -d postgres:15.3-alpine3.18

create-db:
	sudo docker exec -it postgres15.3 createdb --username=root --owner=root simple_bank

grant-all-privileges:
	sudo docker exec -it postgres15.3 psql -U root -d simple_bank -c "GRANT ALL PRIVILEGES ON DATABASE simple_bank TO root;"

drop-db:
	sudo docker exec -it postgres15.3 dropdb simple_bank

migrate-up:
	migrate -path db/migrations -database "postgresql://root:1903@localhost:9876/simple_bank?sslmode=disable" -verbose up

migrate-down:
	migrate -path db/migrations -database "postgresql://root:1903@localhost:9876/simple_bank?sslmode=disable" -verbose down

.PHONY: pull-db-images run-postgres create-db grant-all-privileges drop-db migrate-up migrate-down