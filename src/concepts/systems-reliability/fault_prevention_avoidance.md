# Fault Prevention: Avoidance

There are two phases in fault prevention: **avoidance** and [**elimination**](./fault_prevention_elimination.md).

```admonish tip title="Avoidance"
*Avoidance* aims to limit the introduction of potentially defective data and objects during the execution of the process.
```

Fault prevention through avoidance is a proactive approach to reducing the likelihood of errors and defects in data systems.
It involves implementing measures and practices that ensure the quality and integrity of data and system components from the outset before problems can arise.
The ultimate goal is to create a secure and robust environment that minimizes the introduction or propagation of faults during data processing and handling.

Key strategies in fault prevention via avoidance include:

* **Utilizing Reliable Data Sources**:
  Minimize the risk of incorporating erroneous or low-quality data into the system by ensuring data inputs are sourced from verified and trusted sources.

  ```admonish example
  A financial analytics firm exclusively uses financial data from regulatory-approved and audited sources to ensure the accuracy and reliability of its market analysis models.
  ```

* **Data Cleaning and Validation**:
  Implement systematic processes to clean and validate data before it enters the system, removing inaccuracies, inconsistencies, and irrelevant information to maintain data quality.

  ```admonish example
  A data engineering team routinely ingests customer data from various sources into a data lake.
  To prevent the introduction of defective data, they implement an automated ETL pipeline that includes steps for cleaning data (e.g., removing duplicates) and validating against predefined schemas before storage.
  ```

* **Database Integrity Checks**:
  Regularly check the availability and integrity of tables, columns, and relationships within databases to prevent data structure-related issues.

  ```admonish example
  An analytics engineering team discovers that some reports are failing due to missing fields in the database.
  They implement a nightly database integrity check that verifies the presence and correct data type of critical columns and alerts the team to any discrepancies.
  ```

* **Branch Operators in Data Flow**:
  Use branch operators or conditional logic to manage data flow effectively, ensuring that data is processed and routed correctly based on predefined criteria.

  ```admonish example
  In a data pipeline managing e-commerce transactions, conditional branching assesses the transaction volume and diversity of payment methods.
  It then routes high-volume or diverse payment data to sequential processing tasks, each tailored to a specific payment method, ensuring stability, while lower volumes are directed to parallel tasks for quicker processing, optimizing both resource utilization and processing accuracy.
  ```

* **Code Quality Practices**:
  Enforce rigorous code review processes and adhere to standardized coding conventions and best practices to prevent bugs and vulnerabilities in the system's software components.

  ```admonish example
  In a Python codebase, automated tools like Nix orchestrate a suite of linters (Ruff, Black, Isort) and type checkers (Mypy, Pylance) alongside formatters and beautifiers, enforcing code quality standards with predefined minimum scores, e.g., Ruff > 96%.
  Additionally, Nix executes tests and safety checks, while Poetry manages dependency updates, all triggered automatically on commit or push to maintain a clean, secure, and up-to-date codebase.
  ```

* **Automated Testing**:
  Leverage automated testing frameworks to continuously test software and data processing logic at various stages of development, catching and rectifying faults early.

  ```admonish example
  A data engineering team uses dbt to transform data in their data warehouse.
  They incorporate dbt tests to validate the integrity of key tables automatically after each transformation run, ensuring data consistency and reliability.
  ```

* **Configuration Management**:
  Apply configuration management tools and best practices to meticulously control changes to software and hardware configurations, ensuring stability and preventing unauthorized or untested alterations.

  ```admonish example
  To maintain the reliability of their data analytics platform, a data platform engineering team uses Terraform to manage infrastructure as code.
  This allows them to apply version control to infrastructure changes, ensuring all modifications are reviewed, approved, and traceable.
  ```

* **System Design and Analysis**:
  Conduct thorough requirements analysis and system design reviews to identify and mitigate potential fault sources, employing modeling and simulation tools where applicable.

  ```admonish example
  During the design phase of a new data warehouse, a data architect conducts a thorough analysis using ERD (Entity-Relationship Diagram) modeling tools to ensure the system's design is robust against potential data integrity issues and can handle expected data volumes and complexities.
  ```

* **Fail-safe and Fail-soft Designs**:
  Incorporate design principles that ensure the system remains operational or degrades gracefully in the event of a component failure, such as through redundancy and fallback mechanisms.

  ```admonish example
  Pipeline A halts and alerts the team upon data anomalies (fail-safe).
  Pipelines B and C, dependents of A, also halt to maintain data integrity, while Pipelines D and E, also dependents of A, switch to redundant paths, operating in a degraded mode (fail-soft), balancing system integrity with continued operability.
  ```

By prioritizing fault prevention through avoidance, data teams can build and maintain data systems that are less susceptible to faults, thereby enhancing the overall reliability, security, and performance of data operations.
