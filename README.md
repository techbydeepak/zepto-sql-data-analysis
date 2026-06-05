# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview

This project focuses on **SQL-based exploratory data analysis (EDA)** using the **Zepto grocery dataset**. The goal is to analyze product pricing, discounts, stock availability, estimated revenue, and category performance to derive meaningful business insights.

The analysis was performed using **PostgreSQL** with multiple SQL queries for data cleaning, exploration, and business problem-solving.

---

## 🎯 Objectives

* Perform **data cleaning** on raw grocery product data
* Analyze **discount trends** across products and categories
* Identify **high-value and out-of-stock products**
* Estimate **revenue contribution by category**
* Find **best-value products** using price-per-gram analysis
* Generate **business insights** from retail data

---

## 🗂 Dataset Information

The dataset contains grocery product information from **Zepto**, including:

* Product Name
* Category
* MRP (Maximum Retail Price)
* Discount Percentage
* Selling Price
* Available Quantity
* Product Weight
* Stock Availability

---

## 🛠 Tech Stack

* **SQL (PostgreSQL)**
* **CSV Dataset**
* **Data Cleaning**
* **Exploratory Data Analysis (EDA)**

---

## 🏗 Database Schema

```sql
CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

---

## 🧹 Data Cleaning Process

The following cleaning steps were performed before analysis:

* Removed products where **MRP = 0**
* Converted **paise into rupees**
* Checked for **null values**
* Performed **data exploration and validation**

---

## 📊 SQL Business Questions Solved

### 1️⃣ Top 10 Best-Value Products

Identified products with the **highest discount percentage**.

### 2️⃣ High MRP Products Out of Stock

Found expensive products (**MRP > ₹300**) that are currently unavailable.

### 3️⃣ Estimated Revenue by Category

Calculated estimated revenue using:

```sql
discountSellingPrice × availableQuantity
```

### 4️⃣ Premium Products with Low Discount

Filtered products with:

* **MRP > ₹500**
* **Discount < 10%**

### 5️⃣ Highest Average Discount Categories

Identified categories offering the **best average discounts**.

### 6️⃣ Price Per Gram Analysis

Calculated **cost per gram** to determine better-value products.

### 7️⃣ Product Weight Segmentation

Grouped products into:

* **Low**
* **Medium**
* **Bulk**

based on weight.

### 8️⃣ Total Inventory Weight Per Category

Calculated total inventory weight using:

```sql
weightInGms × availableQuantity
```

---

## 📈 Key Insights

* High-discount products can improve **customer attraction**
* Premium out-of-stock products may lead to **revenue loss**
* Some categories contribute significantly more to **estimated revenue**
* Price-per-gram analysis helps identify **better-value products**

---

## 📂 Project Structure

```bash
├── zepto_v2.csv
├── SQL_Queries.sql
├── Zepto_SQL_Professional_Report.pdf
└── README.md
```

---

## 🚀 Future Improvements

* Create **interactive dashboards**
* Perform **advanced SQL analytics**
* Add **data visualization using Power BI/Tableau**
* Implement **predictive business analysis**

---

## 👨‍💻 Author

**Deepak**
B.Tech CSE Student | Aspiring Data Analyst
