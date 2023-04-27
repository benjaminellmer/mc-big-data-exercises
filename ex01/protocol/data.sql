INSERT INTO orders (idorders, user_iduser, total_sum, date_ordered) VALUES (1, 1, 1200, '12.02.2021');
INSERT INTO orders (idorders, user_iduser, total_sum, date_ordered) VALUES (2, 2, 1400, '22.02.2022');

INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (1, 1, 2, 500.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (1, 2, 1, 200.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (2, 3, 2, 500.00);
INSERT INTO order_item (orders_idorders, product_idproduct, quantity, price) VALUES (2, 2, 2, 200.00);
