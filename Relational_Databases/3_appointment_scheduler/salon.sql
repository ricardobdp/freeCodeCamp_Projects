CREATE DATABASE salon;

\c salon

CREATE TABLE customers(
customer_id SERIAL PRIMARY KEY,
phone VARCHAR(25) UNIQUE NOT NULL,
name VARCHAR(50)
);

CREATE TABLE appointments(
appointment_id SERIAL PRIMARY KEY,
customer_id INT,
service_id INT,
time VARCHAR(25),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
FOREIGN KEY(service_id) REFERENCES services(service_id)
);

CREATE TABLE services(
service_id SERIAL PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO services(name) VALUES('Cut'), ('Color'), ('Perm'), ('Style'), ('Trim');
