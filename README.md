# Blinkit Sales Analysis - A Multi-Tool Capstone Project

![Project Status](https://img.shields.io/badge/status-complete-green) ![Tech Stack](https://img.shields.io/badge/tech-SQL_|_Power_BI_|_Python_|_Excel-blue)
![Blinkit Sales Analysis](https://www.mermaidchart.com/app/projects/0f336acc-11ed-4f5c-9e2d-b03a845e5734/diagrams/4b9171e1-d79b-4129-a3b7-5236bb63b3be/version/v0.1/edit)
```mermaid
flowchart TD
    %% Start
    A[Start: Blinkit Sales Analysis Project]:::blinkitLogo

    %% SQL Section
    B[SQL - Database Structuring & Querying]:::sqlLogo
    C[Key Actions:<br>- Import CSV to MSSQL<br>- Standardize columns<br>- Calculate KPIs<br>- Group & Aggregate Queries]:::sqlLogo

    %% Python EDA Section
    D[Python - Exploratory Data Analysis (EDA)]:::pythonLogo
    E[Key Actions:<br>- Load & Inspect Data<br>- Clean Data<br>- Descriptive Statistics<br>- Visualizations]:::pythonLogo

    %% Power BI Section
    F[Power BI - Interactive Dashboarding]:::powerbiLogo
    G[Key Actions:<br>- Connect SQL<br>- Transform Data<br>- DAX Measures<br>- Interactive Visuals]:::powerbiLogo

    %% Conclusion
    H[Conclusion & Insights]:::blinkitLogo

    %% Connections
    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H

    %% Styles
    classDef blinkitLogo fill:#FFE600,stroke:#000,stroke-width:1px,color:#000;
    classDef sqlLogo fill:#F29111,stroke:#000,stroke-width:1px,color:#000;
    classDef pythonLogo fill:#306998,stroke:#000,stroke-width:1px,color:#fff;
    classDef powerbiLogo fill:#F2C80F,stroke:#000,stroke-width:1px,color:#000;


### Overview
This repository documents an end-to-end data analysis project focused on Blinkit, a leading quick-commerce grocery delivery platform. The project demonstrates a complete analytics workflow, from data cleaning and querying in SQL to building an interactive dashboard in Power BI and performing exploratory data analysis (EDA) in Python. The goal is to derive actionable insights into sales patterns, customer preferences, and operational performance.

---

### 📋 Table of Contents
*   [Project Goal & Objectives](#-project-goal--objectives)
*   [Tech Stack Used](#️-tech-stack-used)
*   [The Analytics Workflow: A Multi-Tool Approach](#-the-analytics-workflow-a-multi-tool-approach)
    *   [1. SQL - Database Structuring & Querying](#1-sql---database-structuring--querying)
    *   [2. Power BI - Interactive Dashboarding](#2-power-bi---interactive-dashboarding)
    *   [3. Python - Exploratory Data Analysis (EDA)](#3-python---exploratory-data-analysis-eda)
*   [Conclusion & Key Insights](#-conclusion--key-insights)

---

### 🎯 Project Goal & Objectives

The primary goal is to perform a comprehensive analysis of Blinkit's sales data to identify trends and provide data-driven recommendations for business optimization.

This was achieved by focusing on the following objectives:

*   **KPI Benchmarking:** Establish a high-level view of business health by calculating core Key Performance Indicators (KPIs):
    *   **Total Sales:** Overall revenue generated.
    *   **Average Sales:** Revenue per transaction.
    *   **Number of Items:** Total volume of items sold.
    *   **Average Rating:** A proxy for customer satisfaction.

*   **Product Performance Analysis:**
    *   Analyze sales performance based on **Fat Content** to understand consumer choices.
    *   Identify the top and bottom-performing **Item Types** to guide inventory and marketing decisions.

*   **Outlet Performance Analysis:**
    *   Evaluate how sales are distributed across different **Outlet Locations** (Tiers).
    *   Analyze the relationship between an outlet's **Establishment Year** and its current sales.
    *   Determine the sales contribution percentage by **Outlet Size** (Small, Medium, High).
    *   Conduct a comprehensive review of all metrics across different **Outlet Types** (e.g., Supermarket, Grocery Store) to find the most effective business models.

---

### 🛠️ Tech Stack Used

*   **Database:** Microsoft SQL Server (MSSQL)
*   **BI & Visualization:** Microsoft Power BI, Microsoft Excel
*   **Programming (EDA):** Python (with Pandas, Matplotlib, Seaborn)
*   **Environment:** Jupyter Notebook

---

### 📊 The Analytics Workflow: A Multi-Tool Approach

This project uniquely showcases how different tools can be leveraged for various stages of the data analysis lifecycle.

#### 1. SQL - Database Structuring & Querying
SQL was used as the foundational step for data cleaning, aggregation, and initial analysis. It acted as the single source of truth for the raw, cleaned data.

**Key Processes:**
*   **Data Import:** The raw CSV data was imported into a dedicated database on an MSSQL server.
*   **Data Cleaning:** The most critical step was standardizing the `Item_Fat_Content` column to correct data entry errors.

    > **Key Query Example (Data Cleaning):**
    > An `UPDATE` statement with a `CASE` clause was used to fix inconsistencies in a single, efficient query.
    ```sql
    UPDATE blinkit_data
    SET Item_Fat_Content = CASE
        WHEN Item_Fat_Content IN ('low fat', 'LF') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;
    ```

*   **KPI & Granular Analysis:** SQL queries were written to calculate the main KPIs and answer the granular business questions.

    > **Key Query Example (Granular Analysis):**
    > A `GROUP BY` query to calculate total sales for each item type, ordered to show top performers.
    ```sql
    SELECT
        Item_Type,
        CAST(SUM(Item_Outlet_Sales) AS DECIMAL(18, 2)) AS TotalSales
    FROM
        blinkit_data
    GROUP BY
        Item_Type
    ORDER BY
        TotalSales DESC;
    ```

<br>

_**[PASTE YOUR SQL ANALYSIS SCREENSHOT OR QUERY RESULTS HERE]**_
<!-- A great spot for a screenshot showing your SQL Server environment or a table with query results. -->
![SQL-SS](https://github.com/user-attachments/assets/95318ce7-4e00-4b2a-ae77-a8cd502ac1c3)


<br>

#### 2. Power BI - Interactive Dashboarding
Power BI was leveraged to transform the cleaned data into a dynamic, interactive dashboard for business stakeholders.

**Key Processes:**
*   **Data Connection & Transformation:** Connected directly to the SQL database and used Power Query to make final adjustments.
*   **DAX for Measures:** Wrote DAX measures to calculate the KPIs (`Total Sales`, `Average Sales`, etc.), making them responsive to user interactions.
*   **Visualization:** Built a variety of visuals, including donut charts, bar charts, line charts, and a matrix to address all the project objectives.
*   **Interactivity:** Implemented slicers for `Outlet Location`, `Outlet Size`, and `Item Type`, allowing users to filter the entire dashboard and drill down into specific segments.

The final dashboard provides a bird's-eye view of the business while enabling deep dives with just a few clicks.

<br>

_**[PASTE YOUR FINAL POWER BI DASHBOARD SCREENSHOT HERE]**_
<!-- This is the perfect place for a high-quality screenshot of your final, polished Power BI dashboard. -->
![PBI-Dashboard](https://github.com/user-attachments/assets/ed9e530b-99d6-444a-a16f-ec7367c3ca16)


<br>

#### 3. Python - Exploratory Data Analysis (EDA)
Python, within a Jupyter Notebook, was used to perform a deep-dive Exploratory Data Analysis (EDA), uncovering patterns and insights through statistical summaries and visualizations.

**Key Processes:**
*   **Data Loading & Inspection:** The data was loaded into a Pandas DataFrame. Initial inspections were performed using `.head()`, `.info()`, and `.describe()`.
*   **Data Cleaning:** Similar to the SQL process, data cleaning operations were performed programmatically using Pandas.
*   **Descriptive Statistics:** Calculated the main KPIs to get a quantitative summary of the data.
*   **Visualization for Insights:** Used **Matplotlib** and **Seaborn** to create plots that visually answer the project's key questions, such as:
    *   A **pie chart** showing the sales distribution by fat content.
    *   A **bar chart** ranking item types by total sales.
    *   A **line chart** tracking sales trends by outlet establishment year.

This programmatic approach is excellent for documenting the analysis step-by-step and creating reproducible results.

<br>

_**[PASTE A SCREENSHOT OF YOUR PYTHON VISUALIZATIONS FROM JUPYTER NOTEBOOK HERE]**_
<!-- Show off one or two of your best charts from the EDA process (e.g., the bar chart and the line chart). -->
![Python-EDA](https://github.com/user-attachments/assets/515cc6ba-18ca-4200-bc10-c11df052c8bd)


<br>

---

### 🚀 Conclusion & Key Insights
This project successfully demonstrates an end-to-end analytical workflow, showcasing proficiency across multiple industry-standard platforms to solve real-world business problems.

From the comprehensive analysis, several key insights were uncovered:

1.  **Product Insights:**
    *   **Low-Fat Products Dominate:** Products categorized as "Low Fat" contribute significantly more to total sales than "Regular" fat products, indicating a health-conscious consumer base.
    *   **Top Categories:** "Fruits and Vegetables" and "Snack Foods" are the highest-grossing item types, suggesting they should be prioritized in inventory and marketing campaigns.

2.  **Operational Insights:**
    *   **Tier 3 Cities Lead Sales:** Surprisingly, outlets in Tier 3 locations generate the highest total sales, presenting a significant opportunity for growth in smaller cities.
    *   **Medium-Sized Outlets are Most Efficient:** Outlets of "Medium" size contribute the highest percentage to sales, suggesting this may be the most optimal and scalable outlet model.
    *   **Supermarket Type 1 is the Strongest Model:** This outlet type consistently outperforms all others across nearly all metrics, including total sales, average sales, and the number of items sold.

Ultimately, this project serves as a practical blueprint for how a data analyst can leverage a multi-tool approach to move from raw data to actionable business intelligence.
