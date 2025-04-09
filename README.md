# 🏠 Airbnb Data Analysis – SQL Capstone Project

This capstone project demonstrates the use of **SQL** to explore, clean, and analyze Airbnb listings data. The project combines multiple datasets (listings, pricing, and reviews) to generate business insights for property hosts, guests, and Airbnb stakeholders.

---

## 📊 Project Overview

- **Title**: Airbnb Data Analysis
- **Focus**: SQL data cleaning, joins, and analytical queries
- **Tools**: SQL (MySQL/PostgreSQL), Excel/CSV
- **Goal**: Deliver meaningful insights on listing performance, pricing trends, and guest feedback using SQL.

---

![Click to view SQL Code](https://github.com/Softechanalytics/airbnbsql/blob/main/AirBnB.sql)

![click to view Dataset](https://github.com/Softechanalytics/airbnbsql/tree/main/dataset)

## 🧾 Datasets Used

| File Name           | Description                                 |
|---------------------|---------------------------------------------|
| `listings.csv/xlsx` | Core listing details (location, host, type) |
| `pricing.csv/xlsx`  | Daily pricing data per listing              |
| `reviews.csv/xlsx`  | Guest review scores and comments            |

---

## 📁 Repository Structure

├── AirBnB.sql # Table creation and data schema 

├── Importing Data SQL Queries.sql # Data import and insert queries 

├── Join Dataset Query.sql # Joins for integrated analysis 

├── SQL Capstone Project.sql # Final business queries 

├── listings.csv / listings.xlsx # Listing metadata 

├── pricing.csv / pricing.xlsx # Pricing per night 

├── reviews.csv / reviews.xlsx # Review text and ratings 

├── README.md # Documentation

pgsql
Copy
Edit

---

## 🧠 Key SQL Concepts Demonstrated

- **Data Importing** using SQL insert statements
- **Data Cleaning** (handling NULLs, correcting data types)
- **Join Operations** to combine datasets (INNER, LEFT, etc.)
- **Aggregate Functions** (`SUM`, `AVG`, `COUNT`)
- **Window Functions** (`RANK`, `ROW_NUMBER`)
- **Filtering & Grouping** with `WHERE`, `GROUP BY`, `HAVING`

---

## 📌 Example Business Questions Answered

1. **Top-rated listings** by guest satisfaction and review count
2. **Average pricing trends** per neighborhood
3. **Revenue potential** per listing based on price and availability
4. **Host analysis** – who has the most listings?
5. **Seasonal pricing fluctuations**
6. **Cancellation policy vs guest rating correlations**
7. **Popular property types** and room categories

---

## 📉 Sample Query

```sql
-- Top 5 highest rated listings by review score
SELECT 
    l.listing_id,
    l.name,
    ROUND(AVG(r.review_score), 2) AS avg_rating,
    COUNT(r.review_id) AS review_count
FROM listings l
JOIN reviews r ON l.listing_id = r.listing_id
GROUP BY l.listing_id, l.name
ORDER BY avg_rating DESC, review_count DESC
LIMIT 5;
📈 Insights
Private rooms are more affordable but generally rated lower than entire homes

Hosts with 5+ listings tend to have higher occupancy rates and revenues

Weekends and holidays show noticeable price surges

Listings with a moderate cancellation policy tend to have better review scores

🚀 How to Use This Project
Clone the repo:

bash
Copy
Edit
git clone https://github.com/yourusername/airbnb-sql-capstone.git
Load data into your SQL environment (MySQL/PostgreSQL).

Run SQL scripts in order:

AirBnB.sql (create schema)

Importing Data SQL Queries.sql (insert data)

Join Dataset Query.sql (combine data)

SQL Capstone Project.sql (run business queries)

👤 Author
Anyakwu Chukwuemeka Isaac
📫 Let's connect on LinkedIn or Email

📝 License
This project is for educational purposes and part of a personal data portfolio.
