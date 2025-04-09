use SeattleDB;
--Problem Solving 1: Find listing with a price greater than $500
select id, name , neighbourhood, price from listings
where price > 500;


-- Problem solving 2: Find listing that are not in the university district" Nighborboard

Select count(*), neighbourhood_group
from listings
group by neighbourhood_group
order by neighbourhood_group DESC;

select 
        id,
        name,
        neighbourhood, 
        neighbourhood_group, 
        price 
from listings
where neighbourhood_group != 'University District';

-- Problem solving 2: Find listing in the "Crown Hill Neighborhood"
select 
        id,
        name,
        neighbourhood, 
        neighbourhood_group, 
        price 
from listings
where neighbourhood = 'Crown Hill';

Select count(*), neighbourhood
from listings
group by neighbourhood
order by neighbourhood ;

-- PROBLEM 4: iDENTIFY LISTINGS THAT HAVE A MINIMUM STAY OF MORE THAN 30 DAYS AND WERE LAST REVIEWED AFTER JANUARY 1, 2023
select 
        id,
        name,
        neighbourhood, 
        neighbourhood_group, 
        price,
        minimum_nights,
        CAST(last_review AS DATE) NEWDATE
from listings
where minimum_nights > 30  AND Cast(last_review as date) > '2023-01-01';

-- Problem 5: combine the name and neighborhood column into a single string (use a dash (-) as the delimiter)

Select Concat(name,' - ',neighbourhood) Newstring
From listings;

-- Problem 6: Extract the first 10 characterss from the name

select name,substring(name,1,10) shortname -- from starting xter of 1 to 10
from listings;

alter table listings
add shortname varchar(10);

update listings
set shortname = substring(name,1,10);

select name, shortname
from listings;

-- Problem 7: Find the length of each reviewers name in the Airbnb_reviews table

Select reviewer_name, len(reviewer_name) legnthofName
from reviews;

--Problem 8: convert all reviewes name to uppercase

Select reviewer_name, upper(reviewer_name) uppername
from reviews;

-- Problem 9: Replace all occurances of "APT" with "UNIT" in the ROOM_TYPE Column

Select Name, room_type,Replace(room_type,'APT','UNIT') replaced_Roomtype
from listings;

-- Problem 10: How many Airbnb listing do we have in Seattle.

Select 
    count(distinct id)
From listings;

-- Problem 11: Compare the average price of listing in different Neighborhoods

select 
    Neighbourhood, 
    round(avg(price),2) Average_Price
FROM listings
Group by neighbourhood;

-- Problem 12: Find the Highest and Lowest Prices Among all Listing by Neighbourhood

SELECT
    Neighbourhood, 
    min(price) Lowest_price,
    max(price) Highest_Price
From Listings
group by Neighbourhood;

SELECT
   
    min(price) Lowest_price,
    max(price) Highest_Price
From Listings;


-- Problem 13: Find the Total Revenue Generated by All Listing

Select 
    format(sum(price),'N2') Total_Revenue
from pricing;

-- Probelm 14: Find Listing With a Reviewer Name that has 'CHRIS' as their name.

Select 
    listing_id,
    reviewer_name
from reviews
    where  reviewer_name like '%CHRIS%'
    order by reviewer_name;

-- Problem 15: Find listings with a Romm_Type that starts with "Entire" or s Neighborhood that contains "Hill"

Select 
        ID, 
        Name,
        Room_type,
       neighbourhood
From listings
Where Room_type like 'Entire%'
    or neighbourhood like '%Hill%';

-- Problem 16: Find reviewers whp 'recommend' a listing
Select 
    Reviewer_name,
    comments
From reviews
where comments like '%recommend%';

-- Problem 17: Find a listing who do not have license

Select 
        id,
        name,
        license
From listings
Where license is Null;


-- Problem 18: Identify reviewers who did not leave any commments
Select 
    Reviewer_name,
    comments
From reviews
where comments is null;

-- Problem 19: Categorize Listings As "High_Price" or "Low-Price" based on their price

select min(price), max(price)
from listings;

Select 
        Name,    
        neighbourhood, 
        price,
        Case When 
                price > 1000 then 'High Price'
                Else 'Low Price'
                END as Price_Category
From listings
order by Price_Category;

-- Problem 20: Categorize comments as "Positive, Neutral or Negative" based on keywords
-- case sentiment analysis

SELECT 
    Reviewer_name,
    Comments,
    CASE 
        WHEN Comments  like '%Excellent%'
            OR Comments like '%great%'
            OR Comments like '%Amazing%'
            OR Comments like '%Recommend%'
        then 'Positive'
        WHEN Comments like '%Good%'
            or Comments like '%Satisfied%'
        Then 'Nautral'
        ELSE 'Negative'
    END AS Sentiment
FROM Reviews
order by Sentiment;

-- Date Manipulation
-- Problem 21: Calculate the total number of reviews for each month in 2023

select top 5 * from listings;

SELECT 
    FORMAT(DATEFROMPARTS(YEAR(last_review), MONTH(last_review), 1), 'MMM yyyy') AS [Month],
    SUM(number_of_reviews) AS Total_review
FROM listings
WHERE YEAR(last_review) = 2023
GROUP BY YEAR(last_review), MONTH(last_review)
ORDER BY YEAR(last_review), MONTH(last_review);

-- Problem 22: Find listing that were last reviewed in the First Quarter of 2023

SELECT 
    DATEPART(QUARTER, last_review) AS Review_Quarter,
    sum(number_of_reviews) AS Total_Reviews
FROM listings
WHERE YEAR(last_review) = 2023 
  AND DATEPART(QUARTER, last_review)  = 1
GROUP BY DATEPART(QUARTER, last_review);

SELECT 
    DATEPART(QUARTER, last_review) AS Review_Quarter,
    sum(number_of_reviews) AS Total_Reviews
FROM listings
WHERE YEAR(last_review) = 2023 
 -- AND DATEPART(QUARTER, last_review)  = 1
GROUP BY DATEPART(QUARTER, last_review);

-- Problem 23: Calculate the number of days between the last_review and the current_Date)

Select 
    Name,
    last_review,
    Cast(getdate() as date) as Today,
    DATEDIFF(DAY,last_review,getdate())
From listings;

-- Creating Training Performance Table

Create Table Training_Performance (
    Student_Name VARCHAR(50),
    Email VARCHAR(50),
    Assimilation_score Int,
    Performance INT
);

-- Insert Data into Training Performance

Insert INTO Training_Performance
VALUEs
    ('Adewale Yusuf', 'Adewale@gmail.com',30,20),
    ('Joe Biden', 'Joee@gmail.com',49,75),
    ('Akin Shola', 'Akin@gmail.com',51,65),
    ('David White', 'White@gmail.com',53,50),
    ('Dara Snow', 'Dara@gmail.com',46,20)

-- Create Employee Detail.
Create Table Employee_Details (
    Employee_Name VARCHAR(50),
    Email VARCHAR(50),
    Department VARCHAR(50),
    Age INT,
    Job_Title VARCHAR(50)
);

-- Insert Data into Employee Detail
Insert into Employee_Details
VALUES
        ('Adewale Yusuf','Adewale@gmail.com','Sales',20,'Sales Analyst'),
        ('Joe Biden', 'Joee@gmail.com','HR',34,'Office Admin'),
         ('Akin Shola', 'Akin@gmail.com','IT',42,'Technical Analyst'),
         ('David White', 'White@gmail.com','Sales',26,'Sales Rep'),
         ('Michelle Sarah', 'Michelle@gmail.com','HR',45,'Head of HR'),
         ('Sean Josh','Sean@gmail.com','IT',30,'CTO');


-- Joins
-- Problem 24: Which Room_Type has the highest number of Reviews.
SELECT
    
    L.room_type,
    count(distinct R.id) as total_Reviews
  
From listings L
Inner Join reviews R
ON L.ID  = R.listing_id
group by L.room_type
order by count(distinct R.id)  desc;


-- Problem 25: Find the total revenue generated by Each Host
SELECT 
    l.Host_name,
    format(sum(p.Price),'N2') as Revenue_generated
From pricing P
Right Join listings l
on L.ID = P.listing_id
Group by l.Host_Name
--having sum(p.price) is null

-- Problem 26: Find the listing without Review

Select 
        l.Name,
        r.Comments 
from Listings L
left Join reviews r 
on l.id = r.listing_id 
where comments is NULL

-- Subquery
-- Problem 27: Find the listings with a Price Higher than the Average Price.
Select 
    Name,
    Price
  
from listings
where Price > ( 
            Select 
                round(avg(price),2)
            From listings )

-- Problem 28: What is the Percentage Contributed by Each Room Type
SELECT 
    room_type, 
    format(sum(price) * 100.0 / (Select sum(price) from listings),'n1')+'%'
From listings
group by room_type;

-- Capstone Study/Capstone Project
-- Find the NeighborHood with the highest total revenue and the average price per listing

Select 
    Top 1
    Neighbourhood,     
    format(max(price),'N2') as Total_Revenue,
    format(Avg(price),'N2') as avg_price
From Listings
    group by Neighbourhood
    order by total_revenue desc;


-- Compare the average price of listings in different neighborhoods
Select 
   
    Neighbourhood,     
    format(Avg(price),'N2') as avg_price
From Listings

    group by Neighbourhood
    order by avg(price) desc;


-- Count the occurence of the word 'Comfortable' in the comment columns

Select 
    Count(id) occurenc_comfortable
From reviews
where comments like '%Comfortable%'

-- Identify listings with a high proportion of positive reviews (comments with "great", "comfortable" and "good")

select 
    l.Name as Listings,
    l.Neighbourhood,
    comments 
from listings L
left join reviews r 
on l.id = r.listing_id
where r.comments like '%great%'
    or r.comments like '%comfortable%'
    or r.comments like '%good%';


WITH review_counts AS (
  SELECT 
    listing_id,
    COUNT(*) AS total_reviews,
    SUM(
      CASE 
        WHEN LOWER(comments) LIKE '%great%' 
           OR LOWER(comments) LIKE '%comfortable%' 
           OR LOWER(comments) LIKE '%good%' 
        THEN 1 ELSE 0 
      END
    ) AS positive_reviews
  FROM reviews
  GROUP BY listing_id
),
positivity_ratio AS (
  SELECT 
    l.id,
    l.name AS Listings,
    l.neighbourhood,
    rc.total_reviews,
    rc.positive_reviews,
    CAST(rc.positive_reviews AS FLOAT) / NULLIF(rc.total_reviews, 0) AS positive_ratio
  FROM listings l
  LEFT JOIN review_counts rc ON l.id = rc.listing_id
)
SELECT 
  Listings,
  Neighbourhood,
  total_reviews,
  positive_reviews,
  ROUND(positive_ratio, 2) AS positive_ratio
FROM positivity_ratio
WHERE positive_ratio >= 0    
 

 -- Calculate the total revenue generated by each host for listing that was last reviewed within the past one year
SELECT 
    host_name,
    YEAR(last_review) AS last_reviewed,
    SUM(price) AS total_revenue
FROM Listings
WHERE last_review >= DATEADD(YEAR, -1, GETDATE())
GROUP BY host_name, YEAR(last_review)
ORDER BY last_reviewed DESC;

-- Find the host with the name 'Stan', regardless of Capitalization

Select 
    Name
From listings
where name like '%Stan%'

-- Calculate the total revenue generated by listing with price above %700

SELECT
    NAME,
    Sum(Price) total_revenue
from listings
group by name
Having sum(price) > 700

-- Find the most reviewed listing

SELECT TOP 1 
    l.name Listing,
    r.listing_id,
    COUNT(r.id) AS review_count
FROM reviews r
JOIN listings l ON r.listing_id = l.id
GROUP BY r.listing_id, l.name
ORDER BY review_count DESC;


-- Find listings that were last reviewed in the last quarter of 2022

Select 
    Name Listing,
    Year(last_review) YEAR,
    Datepart(QUARTER,last_Review) Quaerter
From listings
    Where Year(last_review) = 2022 and Datepart(Quarter,last_Review) = 4;

-- Calculate the total revenue generated for each listing, categorizing them as "high-priced" or "low-priced" based on their relative price relative to the average price price for their neighborhood.



SELECT 
    name AS Listing,
    SUM(price) AS total_price,
    CASE 
        WHEN SUM(price) > 600 THEN 'High Price'
        WHEN SUM(price) > 200 THEN 'Medium Price'
        ELSE 'Low Price'
    END AS Price_category
FROM Listings
GROUP BY name;