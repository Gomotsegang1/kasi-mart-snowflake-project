-- Query 1: Detailed order information and line revenue

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.unit_price,
    o.quantity * p.unit_price AS line_revenue
FROM ORDERS o
JOIN CUSTOMERS c
    ON o.customer_id = c.customer_id
JOIN PRODUCTS p
    ON o.product_id = p.product_id
ORDER BY o.order_date, o.order_id;


-- Query 2: Total revenue per customer

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM ORDERS o
JOIN CUSTOMERS c
    ON o.customer_id = c.customer_id
JOIN PRODUCTS p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC;



-- Query 3: Total revenue per product category

SELECT
    p.category,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM ORDERS o
JOIN PRODUCTS p
    ON o.product_id = p.product_id
GROUP BY
    p.category
ORDER BY total_revenue DESC;



-- Query 4: Top 5 customers by total spend

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_spend
FROM ORDERS o
JOIN CUSTOMERS c
    ON o.customer_id = c.customer_id
JOIN PRODUCTS p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spend DESC
LIMIT 5;
