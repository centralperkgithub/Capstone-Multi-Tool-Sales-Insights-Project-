# Blinkit Sales Analysis - A Multi-Tool Capstone Project

![Project Status](https://img.shields.io/badge/status-complete-green) 
![Tech Stack](https://img.shields.io/badge/tech-SQL_|_Power_BI_|_Python_|_Excel-blue)

---<img width="3860" height="380" alt="Untitled diagram _ Mermaid Chart-2025-08-14-131158" src="https://github.com/user-attachments/assets/761b151c-147f-4a09-8b41-314dd90ff433" />


## Overview
This repository documents an end-to-end data analysis project focused on Blinkit, a leading quick-commerce grocery delivery platform. The project demonstrates a complete analytics workflow, from data cleaning and querying in SQL to building an interactive dashboard in Power BI and performing exploratory data analysis (EDA) in Python. The goal is to derive actionable insights into sales patterns, customer preferences, and operational performance.

---

## 📋 Table of Contents
* [Project Goal & Objectives](#-project-goal--objectives)
* [Tech Stack Used](#-tech-stack-used)
* [The Analytics Workflow: A Multi-Tool Approach](#-the-analytics-workflow-a-multi-tool-approach)
    * [1. SQL - Database Structuring & Querying](#1-sql---database-structuring--querying)
    * [2. Power BI - Interactive Dashboarding](#2-power-bi---interactive-dashboarding)
    * [3. Python - Exploratory Data Analysis (EDA)](#3-python---exploratory-data-analysis-eda)
* [Conclusion & Key Insights](#-conclusion--key-insights)

---

## 🎯 Project Goal & Objectives

The primary goal is to perform a comprehensive analysis of Blinkit's sales data to identify trends and provide data-driven recommendations for business optimization.

**Objectives:**

* **KPI Benchmarking:** Establish a high-level view of business health by calculating core KPIs:
  * Total Sales
  * Average Sales
  * Number of Items
  * Average Rating

* **Product Performance Analysis:**
  * Analyze sales by **Fat Content**
  * Identify top and bottom **Item Types**

* **Outlet Performance Analysis:**
  * Sales distribution across **Outlet Locations (Tiers)**
  * Relationship between **Establishment Year** and sales
  * Sales contribution by **Outlet Size**
  * Compare **Outlet Types** for business efficiency

---

## 🛠️ Tech Stack Used

* **Database:** Microsoft SQL Server (MSSQL)
* **BI & Visualization:** Microsoft Power BI, Microsoft Excel
* **Programming (EDA):** Python (Pandas, Matplotlib, Seaborn)
* **Environment:** Jupyter Notebook

---

## 📊 The Analytics Workflow: A Multi-Tool Approach

This project showcases how different tools are leveraged across stages of the data analysis lifecycle.

```mermaid
flowchart TD
    A[Start: Blinkit Sales Analysis Project] --> B[SQL - Database Structuring & Querying]
    B --> C[Python - Exploratory Data Analysis (EDA)]
    C --> D[Power BI - Interactive Dashboarding]
    D --> E[Conclusion & Key Insights]
