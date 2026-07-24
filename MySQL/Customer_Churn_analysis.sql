create database churn_analysis;
use churn_analysis;

-- Churn rate by contract type and tenure bucket
SELECT
    Contract,
    tenure_bucket,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct
FROM (
    SELECT
        Contract,
        Churn,
        CASE
            WHEN tenure <= 12 THEN '0-12 months'
            WHEN tenure <= 24 THEN '13-24 months'
            WHEN tenure <= 48 THEN '25-48 months'
            ELSE '49+ months'
        END AS tenure_bucket
    FROM customers
) AS t
GROUP BY Contract, tenure_bucket
ORDER BY churn_rate_pct DESC;

-- Total and average revenue at risk by risk segment
SELECT
risk_segment,
COUNT(*) AS customer_count,
ROUND(SUM(MonthlyCharges * 12), 2) AS total_annual_revenue,
ROUND(SUM(churn_probability * MonthlyCharges * 12), 2) AS expected_revenue_at_risk,
ROUND(AVG(churn_probability) * 100, 1) AS avg_churn_probability_pct
FROM customers
GROUP BY risk_segment
ORDER BY expected_revenue_at_risk DESC;

-- Rank customers within each contract type by revenue at risk
SELECT
customerID,
Contract,
MonthlyCharges,
churn_probability,
ROUND(churn_probability * MonthlyCharges * 12, 2) AS revenue_at_risk,
RANK() OVER (
PARTITION BY Contract
ORDER BY churn_probability * MonthlyCharges * 12 DESC
) AS risk_rank_within_contract
FROM customers
WHERE risk_segment = 'High Risk';

-- Running cumulative revenue at risk 
SELECT
customerID,
revenue_at_risk,
SUM(revenue_at_risk) OVER (ORDER BY revenue_at_risk DESC) AS cumulative_revenue_at_risk,
ROUND(
100.0 * SUM(revenue_at_risk) OVER (ORDER BY revenue_at_risk DESC)
/ SUM(revenue_at_risk) OVER (), 2
) AS cumulative_pct_of_total
FROM (
SELECT customerID, ROUND(churn_probability * MonthlyCharges * 12, 2) AS revenue_at_risk
FROM customers
) t
ORDER BY revenue_at_risk DESC;


SELECT
PaymentMethod,
COUNT(*) AS customers,
ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct,
ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;