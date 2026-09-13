CREATE TABLE companies (
    company_id      INT AUTO_INCREMENT PRIMARY KEY,
    ticker          VARCHAR(10) NOT NULL,
    name            VARCHAR(100) NOT NULL,
    sector          VARCHAR(50)
);

CREATE TABLE company_financials (
    financial_id        INT AUTO_INCREMENT PRIMARY KEY,
    company_id           INT NOT NULL,
    year                  INT NOT NULL,
    quarter               INT NOT NULL CHECK (quarter BETWEEN 1 AND 4),
    revenue               DECIMAL(15,2),
    cogs                  DECIMAL(15,2),
    operating_expenses    DECIMAL(15,2),
    rd_expenses           DECIMAL(15,2),
    automotive_gross_margin DECIMAL(5,2),
    operating_income      DECIMAL(15,2),
    net_income            DECIMAL(15,2),
    total_assets          DECIMAL(15,2),
    total_liabilities     DECIMAL(15,2),
    total_equity           DECIMAL(15,2),
    cash                   DECIMAL(15,2),
    CONSTRAINT uq_company_year_qtr UNIQUE (company_id, year, quarter),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE deliveries_production (
    record_id         INT AUTO_INCREMENT PRIMARY KEY,
    company_id          INT NOT NULL,
    model                VARCHAR(30) NOT NULL,
    region               VARCHAR(20) NOT NULL,
    year                  INT NOT NULL,
    quarter               INT NOT NULL CHECK (quarter BETWEEN 1 AND 4),
    units_produced       INT,
    units_delivered      INT,
    CONSTRAINT uq_model_region_year_qtr UNIQUE (company_id, model, region, year, quarter),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE pricing_history (
    price_id         INT AUTO_INCREMENT PRIMARY KEY,
    company_id        INT NOT NULL,
    model              VARCHAR(30) NOT NULL,
    region             VARCHAR(20) NOT NULL,
    price              DECIMAL(10,2) NOT NULL,
    effective_date     DATE NOT NULL,
    end_date           DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);