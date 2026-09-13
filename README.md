# Tesla Financial & Pricing Strategy Analysis (SQL)

## Problem
How has Tesla's pricing strategy, vehicle deliveries, and cost structure
evolved from 2023–2024, and what's the relationship between price changes
and delivery/revenue growth?

## Data Sources
- Tesla SEC 10-Q/10-K filings and quarterly shareholder updates (financials)
- Tesla investor relations vehicle production & delivery reports
- Publicly reported US retail pricing for Model 3 / Model Y

## Schema
See `/diagrams/er_diagram.png`. Four tables: `companies`,
`company_financials` (quarterly), `deliveries_production`
(model/region/quarter), `pricing_history` (date-ranged pricing).

## Key Findings
- Operating margin swung from 5.5% (Q1-2024) to 10.8% (Q3-2024) despite
  relatively flat revenue — cost discipline mattered more than top-line growth.
- Q4-2023 net income ($7.9B) is a reporting anomaly from a one-time tax
  item, not operational performance — flagged and excluded from margin
  trend analysis.

## Sample Query
\`\`\`sql
SELECT year, quarter, revenue, operating_income,
       ROUND(operating_income / revenue * 100, 2) AS operating_margin_pct
FROM company_financials
ORDER BY year, quarter;
\`\`\`

## How to Run
1. Run `sql/01_schema.sql` through `sql/05_load_pricing.sql` in order in MySQL
2. Run `sql/06_analysis_queries.sql` for the analysis