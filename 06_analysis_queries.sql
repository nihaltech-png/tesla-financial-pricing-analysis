-- Quarter-over-quarter revenue growth
SELECT
    year, quarter, revenue,
    LAG(revenue) OVER (ORDER BY year, quarter) AS prev_qtr_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY year, quarter))
        / LAG(revenue) OVER (ORDER BY year, quarter) * 100, 2
    ) AS qoq_growth_pct
FROM company_financials
WHERE company_id = 1
ORDER BY year, quarter;

-- Operating margin per quarter
SELECT year, quarter, revenue, operating_income,
       ROUND(operating_income / revenue * 100, 2) AS operating_margin_pct
FROM company_financials
WHERE company_id = 1
ORDER BY year, quarter;

-- Rank quarters by profitability
SELECT
    year, quarter, operating_income,
    RANK() OVER (ORDER BY operating_income DESC) AS profitability_rank
FROM company_financials
WHERE company_id = 1;