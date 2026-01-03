/*SELECT COUNT(*)FROM telcochurnda1
SELECT DISTINCT Churn FROM telcochurnda1;*/
ALTER TABLE telcochurnda
ALTER COLUMN Churn nvarchar(10);
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    1.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
FROM telcochurnda1;
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    1.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
FROM telcochurnda1
GROUP BY Contract
ORDER BY churn_rate DESC;
SELECT
    CASE
        WHEN tenure < 6 THEN '0–6 months'
        WHEN tenure < 12 THEN '6–12 months'
        WHEN tenure < 24 THEN '12–24 months'
        ELSE '24+ months'
    END AS TenureBucket,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    1.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
FROM telcochurnda1
GROUP BY
    CASE
        WHEN tenure < 6 THEN '0–6 months'
        WHEN tenure < 12 THEN '6–12 months'
        WHEN tenure < 24 THEN '12–24 months'
        ELSE '24+ months'
    END
ORDER BY churn_rate DESC;


