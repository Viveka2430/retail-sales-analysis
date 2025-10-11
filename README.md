# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Database**: `p1_retail_db`

This project demonstrates the use of SQL and techniques commonly employed by data analysts to explore, clean, and analyze retail sales data. It includes setting up a retail sales database, performing exploratory data analysis (EDA), and answering business questions using SQL queries to generate actionable insights.
## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(40),
    age INT,
    category VARCHAR(40),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
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

data cleaning
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL
 OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
 OR age IS NULL
OR category IS NULL
 OR quantity IS NULL
 OR price_per_unit IS NULL
OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL
 OR sale_time IS NULL
OR customer_id IS NULL
 OR  gender IS NULL
OR age IS NULL
OR category IS NULL
 OR quantity IS NULL
 OR price_per_unit IS NULL
OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. ** calculate the total sales for each category.**:
```sql
select
 category,
 sum(total_sale) as net_sales
 from retail_sales
 group by category;
```
2. **find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select 
  Round(avg(age),1) as avg_age
  from  retail_sales
  where category = 'Beauty';
```
3. **find all transactions where the total_sale is greater than 1000.**:
```sql
 select *
 from retail_sales
 where total_sale >1000;

```

4. **find the total number of transactions made by each gender in each category.**:
```sql
select gender,
category,count(*) as no_of_transactions
 from retail_sales
 group by gender,category;

```

5. ** calculate the average sale for each month. Find out best selling month in each year**:
```sql
 select 
 TO_CHAR(sale_date, 'YYYY-MM') AS month,
 avg(total_sale) as avg_sale
 from retail_sales
 group by month
 order by month asc;

```

6. ** find the top 5 customers based on the highest total sales **:
```sql
select 
 customer_id,
 max(total_sale) as top_5_customers
 from  retail_sales
 group by customer_id
 limit 5;
```
7. **find the number of unique customers who purchased items from each category.**:
```sql
select 
 category,
 count(distinct customer_id) as unique_customers
 from retail_sales
 group by category;
```
8. ** create each shift and number of orders ?**:
```sql
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
```
## 📊 Findings

- **Customer Demographics:** The dataset includes customers from various age groups, with sales distributed across categories such as Clothing and Beauty.  
- **High-Value Transactions:** Several transactions had a total sale amount greater than ₹1000, indicating premium purchases.  
- **Sales Trends:** Monthly analysis highlights variations in sales, helping identify peak seasons.  
- **Customer Insights:** The analysis identifies top-spending customers and the most popular product categories.

---

## 📈 Reports

- **Sales Summary:** Summarizes total sales, customer demographics, and category performance.  
- **Trend Analysis:** Provides insights into sales patterns across months and time periods.  
- **Customer Insights:** Displays top customers and unique customer counts per category.

---

## 🖼️ Dashboard Preview

<a.href=https://github.com/Viveka2430/retail-sales-analysis/blob/main/Retail Sales Dashboard.png>View Dashbard</a>

---

### 💡 Tools Used
- Pgadmin
- Power BI  
- Microsoft Excel  
- DAX (for calculated columns and measures)

