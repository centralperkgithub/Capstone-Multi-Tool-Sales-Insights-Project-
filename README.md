# Blinkit Sales Analysis - A Multi-Tool Capstone Project

![Project Status](https://img.shields.io/badge/status-complete-green) 
![Tech Stack](https://img.shields.io/badge/tech-SQL_|_Power_BI_|_Python_|_Excel-blue)

---<img width="3860" height="380" alt="Untitled diagram _ Mermaid Chart-2025-08-14-131158" src="https://github.com/user-attachments/assets/761b151c-147f-4a09-8b41-314dd90ff433" />

# **Blinkit Sales Data Analysis Project** 🚀

![Project Status](https://img.shields.io/badge/status-complete-green) 
![Tech Stack](https://img.shields.io/badge/tech-SQL_|_Power_BI_|_Python_|_Excel-blue)

---

## **📌 Overview**
This repository documents an **end-to-end data analysis project** focused on **Blinkit**, a leading quick-commerce grocery delivery platform.  
The project demonstrates a **complete analytics workflow**, from data cleaning and querying in **SQL**, to building an **interactive dashboard in Power BI**, and performing **Exploratory Data Analysis (EDA) in Python**.  

**Goal:** Derive actionable insights into **sales patterns, customer preferences, and operational performance**.  

---

## **📋 Table of Contents**
1. [Project Goal & Objectives](#-project-goal--objectives)  
2. [Tech Stack Used](#-tech-stack-used)  
3. [The Analytics Workflow: A Multi-Tool Approach](#-the-analytics-workflow-a-multi-tool-approach)  
    - SQL - Database Structuring & Querying  
    - Power BI - Interactive Dashboarding  
    - Python - Exploratory Data Analysis (EDA)  
4. [Conclusion & Key Insights](#-conclusion--key-insights)  

---

## **🎯 Project Goal & Objectives**
The primary goal is to **perform a comprehensive analysis of Blinkit's sales data** to identify trends and provide **data-driven recommendations** for business optimization.  

**Key Objectives:**  
- **KPI Benchmarking:** Establish a high-level view of business health.  
  - Total Sales: Overall revenue generated  
  - Average Sales: Revenue per transaction  
  - Number of Items: Total volume of items sold  
  - Average Rating: Proxy for customer satisfaction  

- **Product Performance Analysis:**  
  - Analyze sales based on **Item Fat Content** to understand consumer choices  
  - Identify **top & bottom-performing item types** for inventory & marketing decisions  

- **Outlet Performance Analysis:**  
  - Evaluate sales distribution across **Outlet Locations (Tiers)**  
  - Analyze the relationship between **Establishment Year** and current sales  
  - Determine sales contribution by **Outlet Size** (Small, Medium, High)  
  - Review metrics across **Outlet Types** (e.g., Supermarket, Grocery Store)  

---

## **🛠️ Tech Stack Used**
- **Database:** Microsoft SQL Server (MSSQL)  
- **BI & Visualization:** Microsoft Power BI, Microsoft Excel  
- **Programming / EDA:** Python (Pandas, Matplotlib, Seaborn)  
- **Environment:** Jupyter Notebook  

---

## **📊 The Analytics Workflow: A Multi-Tool Approach**
This project showcases how **different tools** can be leveraged across various stages of the **data analysis lifecycle**.  

### **1️⃣ SQL - Database Structuring & Querying**
SQL served as the foundation for **data cleaning, aggregation, and initial analysis**.  

**Key Processes:**  
- **Data Import:** Raw CSV data imported into MSSQL database  
- **Data Cleaning:** Standardized the `Item_Fat_Content` column  

**Example Query (Data Cleaning):**
```sql
UPDATE blinkit_data
SET Item_Fat_Content = CASE
    WHEN Item_Fat_Content IN ('low fat', 'LF') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;
```
**KPI & Granular Analysis Example:**
```sql
SELECT Item_Type, CAST(SUM(Item_Outlet_Sales) AS DECIMAL(18, 2)) AS TotalSales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY TotalSales DESC;
```
### **2️⃣ Power BI - Interactive Dashboarding**

**Power BI** was used to transform cleaned data into a **dynamic dashboard** for stakeholders.

**Key Processes:**

- **Data Connection & Transformation:** Connected directly to the SQL database and made adjustments using Power Query.  
- **DAX Measures:** Calculated KPIs such as Total Sales, Average Sales, etc., which update dynamically with user interaction.  
- **Visualization:** Built various charts including **donut charts, bar charts, line charts, and matrices** to address all analysis objectives.  
- **Interactivity:** Implemented **slicers** for Outlet Location, Outlet Size, and Item Type, allowing users to filter the dashboard and drill down into specific segments.

<img width="1534" height="821" alt="image" src="https://github.com/user-attachments/assets/560d0db7-b6ae-4224-89f4-fabd1910433c" />


### 3️⃣ Python - Exploratory Data Analysis (EDA)

**Python** (via **Jupyter Notebook**) was used to perform a **deep-dive analysis**, uncovering patterns and insights through statistical summaries and visualizations.

**Key Processes:**

- **Data Loading & Inspection:** Used Pandas methods like `.head()`, `.info()`, and `.describe()` to explore the dataset.  
- **Data Cleaning:** Programmatically cleaned data similar to the SQL cleaning process.  
- **Descriptive Statistics:** Calculated main KPIs to get a quantitative summary of the data.  
- **Visualizations:**  
  - **Pie chart:** Shows sales distribution by Fat Content.  
  - **Bar chart:** Ranks Item Types by total sales.  
  - **Line chart:** Tracks sales trends by Outlet Establishment Year.






