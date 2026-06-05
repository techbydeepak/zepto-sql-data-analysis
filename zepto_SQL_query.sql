create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL ,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- data exploration

--sample data 
select * from zepto

-- count of rows
select count(*) from zepto;

-- null value check
select * from zepto 
where name IS NULL
or
category is null
or
mrp is null
or
discountpercent is null
or
availablequantity is null
or
discountsellingprice is null
or
weightingms is null
or
outofstock is null
or
quantity is null;


-- different product category
SELECT DISTINCT category
FROM zepto
order by category;

-- products in stock or out of stock
select outofstock, count(sku_id)
from zepto
group by outofstock

-- category count outofstock
select category,
sum(case
		when outofstock = true then 1
		else 0
		end) as countofstock
from zepto
group by category;

-- product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id) >1
order by count(sku_id) desc;



-- data cleaning

-- product with price 0
select * from zepto
where mrp = 0 or discountsellingprice = 0;

delete from zepto
where mrp = 0;

-- convert paise into rupees
update zepto
set mrp = mrp/100.0,
discountsellingprice = discountsellingprice/100.0;

select mrp from zepto;


-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name, mrp, discountpercent
from zepto
order by discountpercent desc
limit 10;

--Q2.What are the Products with High MRP but Out of Stock
select distinct name,mrp
from zepto
where outofstock = true and mrp >300
order by mrp desc;


--Q3.Calculate Estimated Revenue for each category
select  category,
sum(discountsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,
mrp, discountpercent
from zepto
where mrp >500 and discountpercent <10
ORDER BY mrp DESC, discountpercent DESC;



-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discountpercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select  distinct name,
discountsellingprice as price,
weightingms as total_gms,
round(discountsellingprice/weightingms,2) as one_gms_price
from zepto
where weightingms >= 100
order by one_gms_price;

--Q7.Group the products into categories like Low, Medium, Bulk.
select name, weightingms,
case WHEN weightingms <1000 then 'Low'
	 WHEN weightingms <5000 then 'Meadium'
	 else 'Bulk'
	 end as categoryingms
from zepto;	

--Q8.What is the Total Inventory Weight Per Category 
select category,
round(sum(weightingms * availablequantity),1) as total_weight
from zepto
group by category
order by total_weight;
