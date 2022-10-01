up:
	docker volume rm --force minio-data
	docker compose up -d

down:
	docker compose down

trino:
	docker container exec -it trino-coordinator trino

s3:
	open "http://localhost:9001"

trino-ui:
	open "http://localhost:8080"

logs:
	docker logs trino-coordinator

metadata-db:
	docker exec -ti mariadb /usr/bin/mariadb -padmin

restart: down up