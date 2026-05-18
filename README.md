# 🚀 Proplytics

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Poppins&weight=1000&size=28&pause=1000&color=4EA1FF&center=true&vCenter=true&width=900&lines=Welcome+to+Proplytics;Where+Real+Estate+Data+Becomes+Powerful+Insights;Analytics+%7C+Operations+%7C+Decision+Support" />
</p>

<p align="center">
  <img src="docs/images/banner.gif" width="850"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/SSIS-0078D4?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/SSRS-525252?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
</p>

---

# 📌 About The Project

## Proplytics

**Proplytics** is an integrated **Real Estate Analytics & Management System** designed to help real estate companies make smarter, data-driven decisions.

The platform combines operational management with advanced business intelligence to provide a complete view of:

- 🏢 Property Operations
- 📊 Business Analytics
- 📈 Market Trends
- 👥 Customer & Agent Performance
- 💰 Revenue & Pricing Insights

Unlike traditional property listing systems, **Proplytics** transforms raw real estate data into actionable insights that support strategic planning, operational efficiency, and business growth.

<p align="center">
  <img src="docs/images/bar-chart.gif" width="250"/>
</p>

---
# 🏗️ System Architecture

End-to-end Power BI project pipeline — from data modeling to user-facing interface.

```mermaid
flowchart TD
    A["🗂️ 1 · ERD & Mapping\nEntity relationships · source-to-target mapping"]
    B["🛢️ 2 · Database Creation\nTables · keys · indexes · schemas"]
    C["⚙️ 3 · Stored Procedures\nBusiness logic · transformations · automation"]
    D["🏛️ 4 · Data Warehouse DWH\nGalaxy schema · fact & dimension tables"]
    E["🔄 5 · SSIS Integration ETL\nExtract · transform · load into DWH"]
    F["📋 6 · SSRS Reports\nScheduled · paginated · export-ready"]
    G["📊 7a · Power BI Dashboards\nInteractive visuals · KPIs · drill-through"]
    H["🤖 7b · AI Automation\nAssign New User · Notify If Deal is Done"]
    I["🌐 8 · Website Interface\nLog in · Power BI Dashboards"]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    F --> H
    G --> I
    H --> I

    style A fill:#EEEDFE,stroke:#534AB7,color:#3C3489
    style B fill:#E6F1FB,stroke:#185FA5,color:#0C447C
    style C fill:#E6F1FB,stroke:#185FA5,color:#0C447C
    style D fill:#E1F5EE,stroke:#0F6E56,color:#085041
    style E fill:#E1F5EE,stroke:#0F6E56,color:#085041
    style F fill:#FAEEDA,stroke:#854F0B,color:#633806
    style G fill:#FAECE7,stroke:#993C1D,color:#712B13
    style H fill:#FAECE7,stroke:#993C1D,color:#712B13
    style I fill:#FBEAF0,stroke:#993556,color:#72243E
```
---
# 📊 Key Features

## 🏢 Operational Management

- Property management
- Sales operations
- Customer tracking
- Agent management

## 📈 Analytics & Reporting

- Market trend analysis
- Revenue insights
- Sales performance tracking
- Customer behavior analysis
- Interactive dashboards

## 📊 Business Intelligence

- KPI monitoring
- Forecasting support
- Executive reporting
- Data-driven decision making

---

# 🛠️ Technology Stack

| Technology | Purpose |
|------------|----------|
| SQL Server | Database & Data Warehouse |
| SSIS | ETL & Data Integration |
| SSRS | Reporting Services |
| Power BI | Interactive Dashboards & Visualization |

---

# 📂 Project Structure

```bash
Proplytics/
│
├── Mapping/
├── ERD/
├── DataWarehouse/
│
├── SSIS/
├── SSRS/
├── Dashboards/
│
├── docs/
│   └── images/
│
└── README.md
```

---
---

# 🗂️ ERD (Entity Relationship Diagram)

Database relationships, entities, keys, and normalization structure.

<p align="center">
  <img src="ERD/Proplytics-ERD.drawio.png" width="1000"/>
</p>

---

# 🔄 Source To Target Mapping

Business rules, transformation logic, and source-to-destination mapping process.

<p align="center">
  <img src="Mapping/Proplytics-Mapping.drawio.png" width="1000"/>
</p>

---

# 🏛️ Data Warehouse Architecture

Galaxy schema implementation using fact and dimension tables.

## 📌 Included Components

- Fact Tables
- Dimension Tables
- Historical Tracking
- Star / Galaxy Schema
- Analytical Data Modeling

<p align="center">
  <img src="DataWarehouse/images/galaxy-schema.png" width="1000"/>
</p>

---

# 🔄 SSIS ETL Process

End-to-end ETL pipelines built using SQL Server Integration Services (SSIS).

## ⚙️ ETL Workflow

- Data Extraction
- Data Cleaning
- Data Transformation
- Loading Into Data Warehouse
- Automated Processing

<p align="center">
  <img src="SSIS/Dim_Agent.png" width="1000"/>
</p>

---

# 📋 SSRS Reports

Paginated, export-ready operational reports built using SQL Server Reporting Services.

## 📊 Reports Included

- Sales Reports
- Revenue Reports
- Property Reports
- Customer Reports
- Agent Performance Reports

<p align="center">
  <img src="SSRS/Report Images/AgentComission.png" width="1300"/>
</p>

---

# 📊 Power BI Dashboards

Interactive dashboards designed for business intelligence and executive decision-making.

## 📈 Dashboard Capabilities

✔ Executive Overview  
✔ Revenue Analytics  
✔ Sales Performance Tracking  
✔ Customer Insights  
✔ Property Analytics  
✔ Market Trend Analysis  
✔ KPI Monitoring  
✔ Drill-through Analysis  

<p align="center">
  <img src="Dashboards/images/executive-dashboard.png" width="1000"/>
</p>

---

# 🤖 AI Automation

Automation features designed to streamline user management and workflow processes.

## ⚡ Automation Features

- Automatic User Assignment
- Workflow Automation
- Smart System Integration
- Process Optimization

<p align="center">
  <img src="AI-Automation/images/automation-flow.png" width="1000"/>
</p>

---

# 🌐 Website / Application Interface

Custom-built website integrated with Power BI dashboards and authentication system.

## 💻 Application Features

- Login System
- Dashboard Navigation
- Embedded Power BI Reports
- Admin & User Access
- Responsive Interface

<p align="center">
  <img src="Website/images/dashboard-page.png" width="1000"/>
</p>

---

# 📊 Dashboard & Reporting Capabilities

✔ Executive KPI Dashboards  
✔ Sales & Revenue Analysis  
✔ Property Performance Tracking  
✔ Customer Insights  
✔ Agent Productivity Monitoring  
✔ Market Trend Visualization  
✔ Forecasting & Strategic Reporting  

---

# 🎯 Project Goals

- Centralize real estate operational data
- Improve reporting efficiency
- Support executive decision-making
- Enable advanced analytics & insights
- Build scalable BI architecture

---


---

# 👨‍💻 Team Vision

Proplytics was built with the vision of combining **Real Estate Operations** with **Business Intelligence** to create a smarter, insight-driven ecosystem for modern real estate companies.

---

# ⭐ Support

If you like this project, consider giving it a ⭐ on GitHub!
