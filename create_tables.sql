CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY,
    product_name NVARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY IDENTITY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
