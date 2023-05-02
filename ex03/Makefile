neo-up:
	docker compose -f neo4j/docker-compose.yml up -d

pg-up:
	docker run --name postgres-big-data-ex4 -e POSTGRES_PASSWORD=geheim -d postgres:14

postgres:
	docker exec -it postgres-big-data-ex4 psql -U postgres
