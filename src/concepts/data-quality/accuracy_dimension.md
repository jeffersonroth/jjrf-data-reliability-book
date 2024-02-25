# Accuracy Dimension in Data Quality
> Accuracy is one of the most critical dimensions of data quality, referring to the closeness of data values to the true values they are intended to represent. Ensuring accuracy is fundamental across all stages of the data infrastructure, from data sources through ELTs (Extract, Load, Transform) processes, data lakes, data warehouses, to data marts, and ultimately in reports and dashboards.

To measure accuracy, data teams employ various metrics and techniques, often tailored to the specific type of data and its intended use. Here's how accuracy can be measured throughout the data infrastructure:

## Data Sources (Operational Data)
* **Metric**: Error Rate
  * **Formula**: \\( Error \ Rate = \frac{Number\ of \ Incorrect \ Records}{Total \ Number \ of \ Records} \times 100 \\)
  * **Application**: Assess the error rate in operational data by comparing recorded data values against verified true values (from trusted sources or manual verification).

## ELT Processes
* **Metric**: Transformation Accuracy Rate
  * **Formula**: \\( Transformation \ Accuracy \ Rate = \frac{Number \ of \ Correctly \ Transformed \ Records}{Total \ Number \ of \ Transformed \ Records} \times 100 \\)
  * **Application**: Validate the accuracy of data post-transformation by comparing pre and post-ELT data against expected results based on transformation logic.

## Data Lakes and Data Warehouses
* **Metric**: Data Conformity Rate
  * **Formula**: \\( Data \ Conformity \ Rate = \frac{Number \ of \ Records \ Conforming \ to \ Data \ Models}{Total \ Number \ of \ Records} \times 100 \\)
  * **Application**: Ensure that data in lakes and warehouses conforms to predefined data models and schemas, indicating accurate structuring and categorization.

## Data Marts
* **Metric**: Attribute Accuracy
  * **Formula**: \\( Attribute \ Accuracy = \frac{Number \ of \ Correct \ Attribute \ Values}{Total \ Number \ of \ Attribute \ Values} \times 100 \\)
  * **Application**: For each attribute in a data mart, compare the values against a set of true values or rules to assess attribute-level accuracy.

## Reports and Dashboards
* **Metric**: Reporting Accuracy
  * **Formula**: No fixed formula; involves qualitative assessments and cross-validation with known true values or external benchmarks.
  * **Application**: Verify the accuracy of reports and dashboards by cross-referencing with external benchmarks, known datasets, or through manual validation of sample data points.

## Ensuring and Improving Accuracy
Ensuring accuracy across the data infrastructure involves several key practices:

* **Data Profiling and Cleaning**: Regularly profile data at source and post-ELT to identify inaccuracies. Implement data cleaning routines to correct identified inaccuracies.
* **Validation Rules**: Establish comprehensive validation rules that data must meet before entering the system, ensuring only accurate data is processed and stored.
* **Automated Testing and Monitoring**: Implement automated testing of data transformations and monitoring of data quality metrics to continuously assess and ensure accuracy.
* **Feedback Loops**: Create mechanisms for users to report inaccuracies in reports and dashboards, feeding back into data cleaning and improvement processes.

## Accuracy Measurement Example
Measuring accuracy in a data infrastructure involves a series of steps and tools that ensure data remains consistent and true to its source throughout its lifecycle. Here's a detailed example incorporating dbt (data build tool), Soda Core, and SQL queries, illustrating how accuracy can be measured from the moment data is loaded into a data lake or warehouse, through transformation processes, and finally when it is ingested into a data mart, in a different process or pipeline, of course. Each pipeline is orchestrated by Apache Airflow.

**Pipeline 1: Validating Operational Data Post-Load**
* **Scenario**: Once AWS DMS (Database Migration Service) or any ELT tool finishes loading operational data into the data lake or data warehouse, immediate validation is crucial to ensure data accuracy.

* **Implementation**:
  * **Soda Core**: Use Soda Core to run validation checks on the newly ingested data. Soda Core can be configured to perform checks such as row counts, null value checks, or even more complex validations against known data quality rules.
  * **SQL Query**: Write an SQL query to validate specific data accuracy metrics, such as comparing sums, counts, or specific field values against expected values or historical data.

* **Saving Metrics**: Store the results of these validations in a dedicated metrics or audit database, capturing details like the timestamp of the check, the specific checks performed, and the outcomes.
  * **Sample**: 'transactions_yesterday_count' | 1634264 | '2024-02-19T19:12:21.310Z' | 'order_service' | 'orders'

**Pipeline 2: Transforming Data with dbt**
* **Scenario**: Transformations are applied to the ingested data to prepare it for use in data marts, using dbt for data modeling and transformations. After transformations, data is ready to be ingested into data marts for specific business unit analyses.

* **Implementation**:
  * **dbt Tests**: Use dbt's built-in testing capabilities to validate the accuracy of transformed data. This can include unique tests, referential integrity tests, or custom SQL tests that assert data accuracy post-transformation.
  * **dbt Metrics**: Define and calculate key data accuracy metrics within dbt, leveraging its ability to capture and model data quality metrics alongside the transformation logic.
  * **Metric Comparison**: Before the final ingestion into data marts, compare the dbt-calculated accuracy metrics with the initially captured metrics in the audit database to ensure that the transformation process has not introduced inaccuracies.
  * **Automated Alerts**: Implement automated alerts to notify data teams if discrepancies exceed predefined thresholds, indicating potential accuracy issues that require investigation. This can be set in Apache Airflow.
