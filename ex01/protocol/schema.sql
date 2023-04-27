DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders (
  idorders bigint,
  user_iduser bigint,
  married_to bigint,
  total_sum decimal(10,2) NOT NULL,
  date_ordered varchar(15) NOT NULL,
  PRIMARY KEY (idorders)
);

CREATE TABLE IF NOT EXISTS order_item (
  orders_idorders bigint,
  product_idproduct bigint,
  quantity decimal(10,2) NOT NULL,
  price decimal(10,2) NOT NULL,
  PRIMARY KEY (orders_idorders,product_idproduct)
);

