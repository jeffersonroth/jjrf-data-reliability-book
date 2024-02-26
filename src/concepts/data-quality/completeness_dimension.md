# Completeness Dimension in Data Quality
> Completeness is a crucial dimension of data quality, referring to the extent to which all required data is present within a dataset. It measures the absence of missing values or records in the data and ensures that datasets are fully populated with all necessary information for accurate analysis and decision-making.

## Ensuring and Improving Completeness
To maintain high levels of completeness across the data infrastructure, several best practices can be implemented:

* **Data Profiling and Auditing**:
  Regularly profile and audit data at each stage of the pipeline to identify and address missing values or records.

* **Data Quality Rules**:
  Implement data quality rules that enforce the presence of critical data elements during data entry and processing.

* **Data Integration Checks**:
  During ELT processes, include checks to ensure all expected data is extracted and loaded, particularly when integrating data from multiple sources.

* **Null Value Handling**:
  Develop strategies for handling null values, such as data imputation or default values, where appropriate, to maintain analytical integrity.

* **User Training and Guidelines**:
  Educate data producers on the importance of data completeness and provide clear guidelines for data entry and maintenance.

## Completeness Metrics Examples
To assess completeness, data teams utilize various measures and metrics that quantify the presence of data across different stages of the data infrastructure. Here's how completeness can be evaluated throughout the data ecosystem:

### Data Sources (Operational Data) - Missing Data Ratio
\\[ Missing \ Data \ Ratio = \frac{Number\ of \ Missing \ Values}{Total \ Number \ of \ Values} \times 100 \\]

The *Missing Data Ratio* analyzes operational data to identify missing values across critical fields. Use SQL queries or data profiling tools to calculate the missing data ratio for key attributes.

### ELT Processes - Record Completeness Rate
\\[ Record \ Completeness \ Rate = \frac{Number \ of \ Complete \ Records}{Total \ Number \ of \ Records} \times 100 \\]

The *Record Completeness Rate*, after ELT processes, validates the completeness of records by checking for the presence of all expected fields. Automated data quality tools or custom scripts can be used to perform this validation.

### Data Lakes and Data Warehouses - Dataset Completeness
The *Dataset Completeness* ensures that all expected data is loaded into the data lake or warehouse and that datasets are complete. This can involve cross-referencing dataset inventories or metadata against expected data sources. There is no fixed formula, it involves assessing the presence of all expected datasets and their completeness.

### Data Marts - Attribute Completeness
\\[ Attribute \ Completeness = \frac{Number \ of \ Records \ with \ Non-Missing \ Attribute \ Values}{Total \ Number \ of \ Records} \times 100 \\]

For data marts tailored to specific business functions, the *Attribute Completeness* assesses the completeness of critical attributes that support business analysis. SQL queries or data quality tools can automate this assessment.

### Reports and Dashboards - Information Completeness
The *Information Completeness* ensures that reports and dashboards reflect complete information, with no missing data that could lead to incorrect insights. User feedback and manual validation play a key role in this stage. There are no fixed formulas. Qualitative assessment based on user feedback and data validation checks.

## More Completeness Metrics Examples
Completeness as a data quality dimension can be quantified through various metrics tailored to different stages in your data pipeline. Here are some metrics you might consider:

### Record Completeness by Record
\\[ Completeness \ Rate \ by \ Record = \frac{Number\ of \ Complete \ Records}{Total \ Number \ of \ Records} \times 100 \\]

The *Record Completeness by Record* evaluates the proportion of fully populated records in your datasets, where a "complete record" has all fields filled.

### Field Completeness Rate
\\[ Field \ Completeness \ Rate = \frac{Number\ of \ Non-Null \ Field \ Entries}{Total \ Number \ of \ Field \ Entries} \times 100 \\]

The *Field Completeness Rate* measures the percentage of non-null entries for a specific field across all records, ensuring critical data attributes are not missing.

### Source Coverage Rate
\\[ Source \ Coverage \ Rate = \frac{Number \ of \ Fields \ Captured \ by \ Source}{Total \ Number \ of \ Relevant \ Fields \ in \ Source} \times 100 \\]

The *Source Coverage Rate* monitors the extent to which the full range of relevant fields from the source databases are captured during the ELT process.

### Historical Data Coverage Rate
\\[ Historical \ Data \ Coverage \ Rate = \frac{Number \ of \ Historical \ Records \ Loaded}{Expected \ Number \ of \ Historical \ Records} \times 100 \\]

The *Historical Data Coverage Rate* ensures all expected historical data has been loaded into the data lake or warehouse.

### Incremental Load Completeness Ratio
\\[ Incremental \ Load \ Completeness \ Ratio = \frac{Number \ of \ Records \ from \ Latest \ Load}{Expected \ Number \ of \ Records \ for \ the \ Period} \times 100 \\]

The *Incremental Load Completeness Ratio* confirms that the data loaded during the most recent incremental load matches the expected volume for that load period.

### Data Mart Coverage Rate
\\[ Data \ Mart \ Coverage \ Rate = \frac{Number \ of \ Fields \ Used \ in \ Data \ Mart}{Total \ Number \ of \ Available \ Fields} \times 100 \\]

The *Data Mart Coverage Rate* checks whether the data marts include all relevant fields from the staging schemas or upstream data sources for analytics and reporting.

For each of these metrics, you can use Airflow to schedule regular data quality checks, and dbt to perform data tests that evaluate completeness. Implementing these metrics will help ensure that your datasets in the data lake, data warehouse, and data marts are fully populated with the necessary information, enhancing the reliability of your data infrastructure for decision-making processes.

## Example of Completeness Metrics in a Data Quality Metrics/Audit Database
Below is a conceptual example of how metrics for the completeness dimension might be structured within a metrics database:

```sql
-- Table structure for 'data_quality_metric_records'
CREATE TABLE data_quality_metric_records (
    id SERIAL PRIMARY KEY,
    metric_name VARCHAR(255) NOT NULL,
    metric_formula TEXT NOT NULL,
    metric_value NUMERIC(5,2) NOT NULL,
    source_system VARCHAR(255) NOT NULL,
    target_system VARCHAR(255) NOT NULL,
    data_domain VARCHAR(255) NOT NULL,
    measurement_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

-- Sample entries for completeness dimension metrics
INSERT INTO data_quality_metric_records (metric_name, metric_formula, metric_value, source_system, target_system, data_domain, notes)
VALUES
('Record Completeness', '(Number of Complete Records / Total Number of Records) * 100', 97.50, 'Postgres', 'S3', 'Sales', 'Monthly sales data completeness.'),
('Field Completeness', '(Number of Fields without NULLs / Total Number of Fields) * 100', 99.30, 'Oracle', 'Redshift', 'Customer', 'Customer data fields completeness.'),
('Data Mart Completeness', '(Number of Complete Data Mart Records / Total Expected Records) * 100', 98.75, 'MariaDB', 'Data Mart', 'Inventory', 'Inventory data mart completeness after dbt transformation.'),
('ELT Completeness', '(Number of Records Loaded by DMS / Number of Records in Source) * 100', 99.80, 'All Sources', 'Data Lake (S3)', 'All Domains', 'Completeness of the ELT process monitored by DMS tasks.');

-- Query to retrieve the latest completeness metrics for the 'Sales' data domain
SELECT * FROM data_quality_metric_records
WHERE data_domain = 'Sales'
ORDER BY measurement_time DESC
LIMIT 1;
```

In this example:

* `id` is a unique identifier for each metric record.
* `metric_name` describes the type of completeness being measured.
* `metric_formula` provides the formula used to calculate the metric.
* `metric_value` stores the actual metric value, in this case, a percentage.
* `source_system` and `target_system` indicate where the data is coming from and where it is being loaded to.
* `data_domain` specifies the domain or category of the data being measured (e.g., sales, customer, inventory).
* `measurement_time` records the timestamp when the measurement was taken.
* `notes` is an optional field for any additional information or context about the metric.

In a practical data environment, it's crucial to organize data quality metrics and measurement tasks into separate, well-defined tables to maintain clarity and facilitate easy data management. Here's what the structure might look like:

### `data_quality_metrics` Table
This table would act as a reference for all defined metrics, capturing their names, formulas, and other relevant details. As a **type 4 Slowly Changing Dimension (SCD) table**, it would maintain a complete history of each metric, including when they were created or if they were ever retired (`deleted_at`).

### `data_quality_measurement_tasks` Table
This table would contain information about the measurement tasks themselves, including the system used for measurement and the specific source and target systems involved. Like the metrics table, this would also be a type 4 SCD, preserving a historical record of measurement tasks' lifecycles.

### `data_quality_metric_records` Table
Serving as the transaction table, `data_quality_metric_records` would hold the actual records of measurements. Each record would reference the relevant metric (`data_quality_metrics.id`) and measurement task (`data_quality_measurement_tasks`), along with the unique identifier for the run (`run_id`), and a URL pointing to the relevant logs for that run (`run_url`).

### Data Quality Service
The setup would be supported by a dedicated service, tentatively named `data-quality-service`, which would facilitate the recording of measurement data, potentially through an API. The management of `data_quality_metrics` and `data_quality_measurement_tasks` through their APIs, while not detailed in this example, would be a critical part of the overall data quality infrastructure.

By segregating metric definitions, measurement tasks, and actual measurement records into distinct tables and managing them through a dedicated service, organizations can ensure that data quality tracking is both efficient and scalable. This approach allows for the precise pinpointing of data quality issues and facilitates a structured way to track improvements and changes over time.