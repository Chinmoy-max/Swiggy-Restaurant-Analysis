
— Analysis queries

-- Q1: How many restaurants are listed per city?
SELECT city,count(*) as total_restaurents
from swiggy
group by city
order by total_restaurents DESC
limit 10;

-- Q2: What are the most popular cuisines across India?
SELECT cuisine, count(*) as Popular_cuisines
from swiggy
group by cuisine
order by Popular_cuisines DESC
limit 10;

-- Q3: Which restaurant chains have the most branches?
select cuisine,count(*) as total_branches
from swiggy
GROUP by cuisine
ORDER by total_branches DESC
limit 10;

-- Q4: Top 5 cities with highest average restaurant rating?
SELECT city, round(avg(cast(rating as float)),2) as avg_rating, 
count(*) as total_restaurants
from swiggy
GROUP by city
HAVING count(*) > 50
order by avg_rating DESC
limit 5;

-- Q5: What is the average cost for two across cities?

SELECT city,
round(	avg(cast(replace(cost,'₹',' ') as INTEGER)),0) as avg_cost
from swiggy
where cost is not NULL
group by city
order by avg_cost DESC
limit 10;

-- Q6: Which cuisines have the highest average rating?
select cuisine,
avg(CAST(rating as float)) as avg_rating,
count(*) as restaurent_count
from swiggy
group by cuisine
having count(*)>100
order by avg_rating desc
limit 10;


-- Q7: Restaurants with rating above 4.5 and more than 1000 ratings
select name, city, rating, rating_count, cost
from swiggy
where cast(rating as float)>=4.5
and cast(replace(rating_count,'+','') as integer) >=1000
order by rating
limit 10;


-- Q8: Business insight — which city has best value for money?
-- (high rating, low cost)
select city,
round(avg(CAST(rating as float)),2) as avg_rating,
round(	avg(cast(replace(cost,'₹',' ') as INTEGER)),0) as avg_cost
from swiggy
GROUP by city
having count(*)>30
order by avg_rating desc, avg_cost asc
limit 10;

-- What are the most Popular Cuisines served throughout the dataset ?
select cuisine, count(*)
from swiggy
GROUP by cuisine
order by count(*) desc
limit 10;

