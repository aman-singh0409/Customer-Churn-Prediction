# Customer Churn Prediction & ROI Simulation

## Overview

This project is an end-to-end data analytics solution that predicts customer churn and evaluates customer retention strategies using Return on Investment (ROI) simulation. It combines machine learning, SQL analysis, and an interactive Power BI dashboard to help businesses identify high-risk customers and recommend the most cost-effective retention strategy.

The project is built using the IBM Telco Customer Churn dataset and follows a complete analytics workflow from data preprocessing to business decision support. :contentReference[oaicite:0]{index=0}

---

## Business Problem

Customer churn leads to significant revenue loss for subscription-based businesses. While predicting churn is valuable, businesses also need to determine which retention strategy provides the highest return on investment.

This project addresses both problems by:
- Predicting customers likely to churn.
- Segmenting customers by churn risk.
- Estimating revenue at risk.
- Comparing retention strategies using ROI analysis.

---

## Dataset

**Source:** IBM Telco Customer Churn Dataset (Kaggle)

- ~7,043 customer records
- 21 original features
- Customer demographics
- Service subscriptions
- Billing information
- Customer churn status

---

## Project Workflow

### Data Preprocessing
- Data cleaning and missing value handling
- Data type conversion
- Exploratory Data Analysis (EDA)

### Feature Engineering
- Created business-driven features including:
  - New customer indicator
  - Number of subscribed services
  - Average monthly spending
  - High-value customer flag
  - Month-to-month contract indicator

### Machine Learning
- Random Forest Classifier for churn prediction
- Generated churn probability for every customer
- Segmented customers into:
  - Low Risk
  - Medium Risk
  - High Risk

### Revenue at Risk Analysis
- Estimated annual customer value
- Calculated expected revenue at risk
- Identified high-value customers requiring retention efforts

### ROI Simulation
Compared three retention strategies:

- Outreach Call
- 20% Discount
- Feature Nudge

For each strategy the following metrics were calculated:
- Total Cost
- Revenue Saved
- Net Benefit
- ROI %

### SQL Analysis
Performed business analysis using SQL including:
- Churn analysis by contract and tenure
- Revenue at risk by customer segment
- Customer segmentation
- Payment method analysis

### Power BI Dashboard
Developed a three-page interactive dashboard consisting of:

**Executive Overview**
- Customer KPIs
- Churn distribution
- Churn by contract
- Churn by tenure

**Customer Segmentation**
- Risk segmentation
- Revenue at risk analysis
- Customer value vs. churn probability
- Feature importance

**ROI Strategy Simulator**
- Strategy comparison
- ROI analysis
- Net benefit comparison
- Interactive effectiveness parameter

---

## Key Insights

- Month-to-month customers exhibit the highest churn rate.
- Customers with shorter tenure are significantly more likely to churn.
- High-risk customers contribute the majority of expected revenue at risk.
- Feature importance analysis identifies contract type, tenure, and monthly charges among the strongest churn drivers.
- ROI simulation enables comparison of retention strategies to support business decision-making.

---

## Tech Stack

- Python
- Pandas
- NumPy
- Scikit-learn
- SQL (MySQL)
- Power BI
- DAX
- Jupyter Notebook

---

## Dashboard Preview

### Executive Overview
Displays overall business KPIs including customer count, churn rate, high-risk customers, revenue at risk, churn distribution, contract analysis, and tenure-based churn trends.

![Executive Overview](Dashboard/Screenshots/executive-overview.png.png)

### Customer Segmentation
Visualizes customer risk distribution, revenue at risk across services and payment methods, customer value versus churn probability, and machine learning feature importance.

![Customer Segmentation](Dashboard/Screenshots/customer-segmentation.png.png)

### ROI Strategy Simulator
Compares retention strategies using ROI, net benefit, total cost, and revenue saved with an interactive effectiveness parameter for scenario analysis.

![ROI Strategy Simulator](Dashboard/Screenshots/roi-simulator.png.png)

## Future Improvements

- Hyperparameter tuning for improved model performance
- Model comparison using XGBoost or LightGBM
- SHAP-based model explainability
- Streamlit web application for live predictions
- Deployment of the prediction pipeline

---

## Author

Aman Kumar Singh

B.Tech Computer Science Engineering
