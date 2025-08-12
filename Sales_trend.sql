select * from sales_data;

SELECT sales FROM sales_data;

# TO FIND OUT THE TOTAL REVENUE
select sum(sales) as total_revenue from sales_data;

# TO FIND OUT THE TOTAL COUNT OF ORDERS
SELECT COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales_data;

# TOTAL SALES BY CITY
SELECT City, SUM(sales) AS total_revenue
FROM sales_data
GROUP BY City
ORDER BY total_revenue DESC;

#Monthly revenue
SELECT YEAR_ID, MONTH_ID, SUM(SALES) AS monthly_revenue
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

# Top 5 customers by revenue
SELECT CUSTOMERNAME, SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY total_revenue DESC
LIMIT 5;

#Orders by product line
SELECT PRODUCTLINE, COUNT(*) AS total_orders, SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY total_revenue DESC;

#Top 3 months by sales
SELECT 
    YEAR_ID AS year,
    MONTH_ID AS month,
    SUM(SALES) AS monthly_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS order_volume
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY monthly_revenue DESC
LIMIT 3;

# Monthly revenue for specific year
SELECT 
    YEAR_ID AS year,
    MONTH_ID AS month,
    SUM(SALES) AS monthly_revenue
FROM sales_data
WHERE YEAR_ID = 2004
GROUP BY YEAR_ID, MONTH_ID
ORDER BY month;

# Best selling products by total revenue and quantity
SELECT PRODUCTCODE, 
       SUM(SALES) AS total_revenue,
       SUM(QUANTITYORDERED) AS total_quantity
FROM sales_data
GROUP BY PRODUCTCODE
ORDER BY total_revenue DESC;

#Revenue bu order status
SELECT STATUS, 
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY STATUS
ORDER BY total_revenue DESC;

# Quarter wise revenue trend
SELECT YEAR_ID, QTR_ID, 
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY YEAR_ID, QTR_ID
ORDER BY YEAR_ID, QTR_ID;

drop table sales_data;