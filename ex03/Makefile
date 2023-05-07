up: neo-up pg-up
down: neo-down pg-down

neo-up:
	docker compose -f neo4j/docker-compose.yml up -d

neo-down:
	docker compose -f neo4j/docker-compose.yml down

pg-bootstrap:
	docker run --name postgres-big-data-ex4 -e POSTGRES_PASSWORD=geheim -d postgres:14

pg-up:
	docker start postgres-big-data-ex4

pg-down:
	docker stop postgres-big-data-ex4

postgres:
	docker exec -it postgres-big-data-ex4 psql -U postgres

neo:
	docker exec -it neo4j cypher-shell -u neo4j -p password
