Step 1:
git https://github.com/Digital-Media/elk-stack-dock
cd elk-stack-dock
docker compose -f docker-compose.yml up -d
docker exec -it elk-stack-dock_logstash_1 /bin/bash
whereis logstash
cd /usr/share/logstash/bin
logstash -e 'input { stdin { } } output { stdout {} }'
-> sc01
logstash --path.data data2 -e 'input { stdin { } } output { stdout {} }'
-> sc02
logstash-plugin list --verbose | grep "jdbc"
-> sc03
/usr/share/logstash/bin/logstash --path.settings /usr/share/logstash/config -t
-> sc04

Step 2:
docker exec -it postgres psql -d postgres -U postgres
CREATE TABLE IF NOT EXISTS order_item (
  orders_idorders bigint,
  product_idproduct bigint,
  quantity decimal(10,2) NOT NULL,
  price decimal(10,2) NOT NULL,
  PRIMARY KEY (orders_idorders,product_idproduct)
);

INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (1, 1, 2, 500.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (1, 2, 1, 200.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (2, 3, 2, 500.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (2, 2, 2, 200.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (3, 2, 2, 200.00);

-> sc05
cd /usr/share/logstash/logstash-core/lib/jars
curl -o postgresql-42.5.4.jar https://jdbc.postgresql.org/download/postgresql-42.5.4.jar
# Test if the pipeline works
/usr/share/logstash/bin/logstash --path.data data2 -e 'input {
  jdbc {
    jdbc_connection_string => "jdbc:postgresql://192.168.0.23:5432/postgres"
    jdbc_user => "postgres"
    jdbc_password => "geheim"
    jdbc_driver_class => "org.postgresql.Driver"
    statement => "SELECT * FROM order_item"
  }
} output {
  stdout {}
}'

# In Local terminal
cd logstash/pipeline/
nvim logstash.conf
docker stop elk-stack-dock_logstash_1 && docker start elk-stack-dock_logstash_1
input {
  jdbc {
     jdbc_connection_string =>     "jdbc:postgresql://192.168.0.23:5432/postgres"
     jdbc_user => "postgres"
     jdbc_password => "geheim"
     jdbc_driver_class => "org.postgresql.Driver"
     statement => "SELECT * FROM order_item where id > :sql_last_value"
	 tracking_column => "id"
	 schedule => "*/5 * * * *"
 }
}

output {
  elasticsearch {
	hosts => "elasticsearch:9200"
	user => "elastic"
	password => "changeme"
    index => "order_item"
    document_id => "order_item_%{orders_idorders}"
    doc_as_upsert => true
 }
}
docker exec -it postgres psql -d postgres -U postgres
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (3, 2, 2, 200.00);

INSERT INTO orders (idorders, user_iduser, total_sum, date_ordered) VALUES (3, 2, 1400, '23.02.2022');

input {
  jdbc {
     jdbc_connection_string =>     "jdbc:postgresql://192.168.0.23:5432/postgres"
     jdbc_user => "postgres"
     jdbc_password => "geheim"
     jdbc_driver_class => "org.postgresql.Driver"
     statement => "SELECT * FROM order where idorders > :sql_last_value"
	 tracking_column => "idorders"
	 schedule => "*/5 * * * *"
 }
}

output {
  elasticsearch {
	hosts => "elasticsearch:9200"
	user => "elastic"
	password => "changeme"
    index => "orders"
    document_id => "order_item_%{idorders}"
    doc_as_upsert => true
 }
}
