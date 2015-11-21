-- DEFINE YOUR DATABASE SCHEMA HERE

DROP TABLE IF EXISTS glass;


CREATE TABLE glass(
  id SERIAL PRIMARY KEY,
  employee VARCHAR(255),
  employee_email VARCHAR(255),
  customer_and_account_no VARCHAR(255),
  product_name VARCHAR(255),
  invoice_frequency VARCHAR(255),
  invoice_no VARCHAR(255),
  sale_date VARCHAR (255),
  sale_amount VARCHAR(255),
  units_sold INTEGER
);
