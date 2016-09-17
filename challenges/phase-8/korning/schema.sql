DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS products;

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  customer VARCHAR(255) UNIQUE,
  account_no VARCHAR(255) UNIQUE
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) UNIQUE
);

CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  sale_date VARCHAR(255),
  sale_amount VARCHAR(255),
  units_sold INT,
  invoice_no INT,
  invoice_frequency VARCHAR(255),
  employee_id INT REFERENCES employees(id),
  customer_id INT REFERENCES customers(id),
  product_id INT REFERENCES products(id)
);
