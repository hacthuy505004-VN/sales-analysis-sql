-- Tổng doanh thu theo sản phẩm
SELECT p.product_name, SUM(s.quantity * p.price) AS revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Top khách hàng chi tiêu nhiều nhất
SELECT c.name, SUM(s.quantity * p.price) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Doanh thu theo ngày
SELECT sale_date, SUM(quantity * price) AS daily_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY sale_date;

-- Top sản phẩm 
SELECT product_name, revenue,
RANK() OVER (ORDER BY revenue DESC) AS ranking
FROM (
    SELECT p.product_name, SUM(s.quantity * p.price) AS revenue
    FROM Sales s
    JOIN Products p ON s.product_id = p.product_id
    GROUP BY p.product_name
) t;

-- Doanh thu theo tháng 
SELECT 
    FORMAT(sale_date, 'yyyy-MM') AS month,
    SUM(quantity * price) AS revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY FORMAT(sale_date, 'yyyy-MM');
