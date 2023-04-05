-- Create a new table for storing customer information
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    created_at DATETIME DEFAULT NOW()
);

-- Insert some sample data into the table
INSERT INTO customers (customer_id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234'),
(2, 'Jane', 'Doe', 'janedoe@example.com', '555-5678'),
(3, 'Bob', 'Smith', 'bobsmith@example.com', '555-9876');

-- Retrieve all customer information
SELECT * FROM customers;

-- Retrieve only the customer information for customer_id 1
SELECT * FROM customers WHERE customer_id = 1;
