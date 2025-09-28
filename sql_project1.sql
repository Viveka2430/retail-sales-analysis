create table retail_sales (transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender char(40),
age	int,
category char(40),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);

data_cleaning 
select * from retail_sales;
select * from retail_sales
where transactions_id is null 
or 
sale_date is null
or 
sale_time  is null 
or 
customer_id is null
or
gender is null 
or
age	is null
or
category is null 
or 
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;

delete_nul_values
delete from retail_sales
where transactions_id is null 
or 
sale_date is null
or 
sale_time  is null 
or 
customer_id is null
or
gender is null 
or
age	is null
or
category is null 
or 
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;

data_exploration
how many sales we have?
select count(*) as total_sales
from retail_sales;

how many customers we have?
select count(distinct customer_id) as total_customer
from retail_sales;

how many category we have?
select distinct category as total_category
from retail_sales;

 Data_Analysis & Findings
 1. calculate the total sales for each category?
 select
 category,
 sum(total_sale) as net_sales
 from retail_sales
 group by category;

 2.find the average age of customers who purchased items from the 'Beauty' category
  select 
  Round(avg(age),1) as avg_age
  from  retail_sales
  where category = 'Beauty';

 3. find all transactions where the total_sale is greater than 1000
 select *
 from retail_sales
 where total_sale >1000;

 4.find the total number of transactions made by each gender in each category.
 select gender, category,count(*) as no_of_transactions
 from retail_sales
 group by gender,category;

 5.calculate the average sale for each month. Find out best selling month in each year.
 select 
 TO_CHAR(sale_date, 'YYYY-MM') AS month,
 avg(total_sale) as avg_sale
 from retail_sales
 group by month
 order by month asc;

 6.find the top 5 customers based on the highest total sales
 select 
 customer_id,
 max(total_sale) as top_5_customers from  retail_sales
 group by customer_id
 limit 5;
 
 7.find the number of unique customers who purchased items from each category
 select 
 category,
 count(distinct customer_id) as unique_customers
 from retail_sales
 group by category;

 8.create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM
    retail_sales
GROUP BY
    shift
ORDER BY
    shift;

