.PHONY: up down logstash postgres

pg-up:
	docker compose -f postgres/docker-compose.yml up -d --build

pg-down:
	docker compose -f postgres/docker-compose.yml down

elk-up:
	docker compose -f elk-stack-dock/docker-compose.yml up -d --build --remove-orphans

elk-down:
	docker compose -f elk-stack-dock/docker-compose.yml down

postgres:
	docker exec -it postgres psql -U postgres

logstash:
	docker exec -it elk-stack-dock_logstash_1 /bin/bash 
	
metricbeat:
	docker exec -it elk-stack-dock_metricbeat_1 /bin/bash 

down: pg-down elk-down

up: pg-up elk-up

restart-logstash:
	docker stop elk-stack-dock_logstash_1 && docker start elk-stack-dock_logstash_1 

start-logstash:
	docker start elk-stack-dock_logstash_1

stop-logstash:
	docker stop elk-stack-dock_logstash_1

stop-metricbeat:
	docker stop elk-stack-dock_metricbeat_1

logs-logstash:
	docker logs -f elk-stack-dock_logstash_1

logs-kibana:
	docker logs -f elk-stack-dock_kibana_1

clean-volumes:
	docker volume prune -f;

edit-pipeline:
	nvim ./elk-stack-dock/logstash/pipeline/logstash.conf

rerun-setup:
	docker compose -f elk-stack-dock/docker-compose.yml rm setup 
	docker volume rm elk-stack-dock_setup 
	docker-compose -f elk-stack-dock/docker-compose.yml up setup

mb-up: 
	docker-compose \
		-f elk-stack-dock/docker-compose.yml \
		-f elk-stack-dock/extensions/metricbeat/metricbeat-compose.yml \
	 	up -d

restart-metricbeat:
	docker-compose \
		-f elk-stack-dock/docker-compose.yml \
		-f elk-stack-dock/extensions/metricbeat/metricbeat-compose.yml \
		restart metricbeat

logs-metricbeat:
	docker logs -f elk-stack-dock_metricbeat_1

edit-envs:
	nvim ./elk-stack-dock/.env

install-driver:
	docker exec -it elk-stack-dock_logstash_1 \
		/usr/bin/curl -o /usr/share/logstash/logstash-core/lib/jars/postgresql-42.5.4.jar \
		https://jdbc.postgresql.org/download/postgresql-42.5.4.jar

request:
	curl -X GET -u elastic:changeme "http://localhost:9200/orders/_search?pretty"  -H 'Content-Type: application/json' -d '{
	  "query": { 
		"match": { 
		  "_doc": "orders_1"
		}
	  }
	}'

