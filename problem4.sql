CREATE DATABASE gerenciamento de pedidos;

CREATE TABLE gerenciamento de pedidos.cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  email character varying(60) NOT NULL,
  CONSTRAINT customers._pkey PRIMARY KEY (id)
);

CREATE TABLE gerenciamento de pedidos.ordem (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id integer NOT NULL DEFAULT nextval('products_id_seq'::regclass),
      date_create timestamp(0) without time zone,
      customers_id integer NOT NULL,
      CONSTRAINT orders._pkey PRIMARY KEY (id),
      CONSTRAINT orders_customers_id_foreign FOREIGN KEY (customers_id)
          REFERENCES dev_challenge.customers (id) MATCH SIMPLE
          ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE gerenciamento de pedidos.produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL, -- tipo de valor que a variável pode receber
      sku integer NOT NULL,
      price numeric(10,2),
      CONSTRAINT products._pkey PRIMARY KEY (id)
);
CREATE TABLE dev_challenge.orders_products
(
      id integer NOT NULL DEFAULT nextval('orders_products_id_seq'::regclass),
      CONSTRAINT orders_products_pkey PRIMARY KEY (id)
);

ALTER TABLE dev_challenge.orders_products
    ADD
        order_id integer NOT NULL,
        product_id integer NOT NULL,
        CONSTRAINT orders_products_order_id_foreign FOREIGN KEY (order_id)
            REFERENCES dev_challenge.orders (id) MATCH SIMPLE
            ON UPDATE NO ACTION ON DELETE NO ACTION,
        CONSTRAINT orders_products_products_id_foreign FOREIGN KEY (product_id)
            REFERENCES dev_challenge.orders (id) MATCH SIMPLE
            ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE dev_challenge.products
    ADD
        orders_products_id integer,
        CONSTRAINT products_orders_products_id_foreign FOREIGN KEY (orders_products_id)
            REFERENCES dev_challenge.orders_products (id) MATCH SIMPLE
            ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE dev_challenge.orders
    ADD
        orders_products_id integer,
        CONSTRAINT orders_orders_products_id_foreign FOREIGN KEY (orders_products_id)
            REFERENCES dev_challenge.orders_products (id) MATCH SIMPLE
            ON UPDATE NO ACTION ON DELETE NO ACTION;
