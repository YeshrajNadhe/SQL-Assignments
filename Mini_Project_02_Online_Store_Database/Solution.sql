CREATE DATABASE online_store;
USE online_store;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'rahul@example.com', 'Mumbai'),
(2, 'Priya Verma', 'priya@example.com', 'Delhi'),
(3, 'Amit Singh', 'amit@example.com', 'Bangalore'),
(4, 'Neha Patel', 'neha@example.com', 'Pune'),
(5, 'Vikram Rao', 'vikram@example.com', 'Chennai');

INSERT INTO products VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Smartphone', 20000.00, 20),
(3, 'Headphones', 1500.00, 50),
(4, 'Keyboard', 800.00, 30),
(5, 'Mouse', 500.00, 40);

INSERT INTO orders VALUES
(1, 1, '2025-08-10'),
(2, 2, '2025-08-11'),
(3, 3, '2025-08-12');

INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 3, 4, 3),
(5, 3, 5, 2);

SELECT name, city FROM customers;

SELECT * FROM products WHERE price > 500;

SELECT o.order_id, c.name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name;

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 3;

SELECT name
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);
