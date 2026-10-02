INSERT INTO customers
(customer_id, customer_name, city)
VALUES  (5,'Ravi', 'Ayodhya');
       

select *
from customers;


SELECT
    customers.customer_name,
    customers.city,
    orders.sales
FROM customers
JOIN orders
    ON customers.customer_name = orders.customer_name;



	SELECT
    customers.customer_name,
    customers.city,
    SUM(orders.sales) AS total_sales
FROM customers
JOIN orders
    ON customers.customer_name = orders.customer_name
GROUP BY customers.customer_name, customers.city
ORDER BY total_sales DESC;





SELECT *
FROM orders
WHERE sales > (
    SELECT AVG(sales)
    FROM orders
);

select 
    customer_name,
	sales,
	case 
	when sales>=2000 then
	'high'
	when sales >= 1000 then
	'medium'
	else 'low'
	end as sales_level
	FROM ORDERS;


 SELECT 
 CUSTOMER_NAME,
 SALES,
 RANK() OVER(ORDER BY SALES DESC)
 AS SALES_RANK
 FROM ORDERS;


 WITH CUSTOMER_SALES AS(SELECT
  CUSTOMER_NAME,
  SUM (SALES) AS TOTAL_SALES
  FROM ORDERS
  GROUP BY CUSTOMER_NAME
 )
 SELECT*
 FROM CUSTOMER_SALES
 ORDER BY TOTAL_SALES DESC;
