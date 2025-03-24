```admonish warning title="Page under construction"
:construction:
```

# N-Tier Architecture

```admonish tip title="N-Tier Architecture"
N-tier architecture is an extension of the three-tier architecture that further separates concerns and functionalities into more discrete layers or tiers.
This approach enhances scalability, maintainability, and flexibility, making it suitable for complex, large-scale applications and data systems.
```

In the context of data systems, n-tier architecture might involve the following tiers, each focusing on specific aspects of the system:

**Presentation Tier**:
This is the user interface layer where users interact with the system. It could include web clients, desktop applications, mobile apps, and dashboards.

**Business Logic Tier**:
This layer handles the application's core functionality, including data processing logic, business rules, and task coordination. It acts as an intermediary between the presentation and data layers.

**Data Access Tier**:
This tier is responsible for communicating with the data storage layer. It abstracts the underlying data operations (like CRUD operations) from the business logic layer, providing a more modular approach.

**Data Storage Tier**:
This is where the data resides. It can include relational databases, NoSQL databases, file systems, or even external data sources. For more complex systems, this tier might comprise multiple databases or storage solutions, each optimized for specific types of data or access patterns.

**Cache Tier**:
An optional but often crucial layer, the cache tier stores frequently accessed data in memory to speed up data retrieval and reduce the load on the data storage tier.

**Integration Tier**:
An integration tier handles these interactions in systems that must communicate with external services, APIs, or legacy systems, ensuring the core system remains decoupled from external dependencies.

**Security Tier**:
This dedicated layer manages authentication, authorization, and security policies, centralizing security mechanisms instead of scattering them across other tiers.

**Analytics and Reporting Tier**:
Especially for data systems, an analytics tier might be included to handle data warehousing, big data processing, and business intelligence operations, separate from the operational data systems.

**Microservices/Service Layer**:
Each microservice can be considered a tier in a microservices architecture, encapsulating a specific business capability and communicating with other services through well-defined interfaces.

**Application/Service Orchestration Tier**:
This layer manages the interactions and workflows between different services or components, especially in a microservices or distributed environment.

In an n-tier architecture, each tier can scale independently, be updated or maintained without significantly impacting other parts of the system, and even be distributed across different servers or environments to enhance performance and reliability.
This architecture provides high flexibility and modularity, allowing teams to adopt new technologies, scale parts of the system as needed, and improve resilience by isolating failures to specific tiers.

However, the complexity of managing an n-tier architecture should not be underestimated.
It requires careful planning, robust infrastructure, and effective communication mechanisms between tiers, often increasing development and maintenance costs.
Proper implementation of n-tier architectures can lead to highly scalable, flexible, and maintainable systems, making them suitable for complex enterprise-level applications and data systems.

Here are examples of n-tier architecture applied in scenarios where data engineering and analytics teams play a central role:

```admonish example title="Data Analytics Platform"
**Presentation Tier**: Web-based dashboards and visualization tools that allow business users to interact with complex datasets, generating custom reports and visual insights.

**Business Logic Tier**: Custom analytics engines and services that process business logic, such as trend analysis, forecasting, and segmentation algorithms, tailored to specific business needs.

**Data Access Tier**: APIs and services designed to abstract and manage queries to various data sources, ensuring efficient data retrieval and updates according to user interactions on the dashboards.

**Data Processing Tier**: Dedicated microservices or batch processing jobs that clean, transform, and enrich raw data from various sources, preparing it for analysis. This might involve ETL processes, data normalization, and application of business rules.

**Data Storage Tier**: A combination of data warehouses for structured data and data lakes for unstructured or semi-structured data, optimized for analytical queries and big data processing.

**Cache Tier**: Caching mechanisms for storing frequently accessed reports, dashboards, and intermediate data sets to speed up data retrieval and improve user experience.

**Integration Tier**: Connectors and integration services that pull data from diverse sources like CRM systems, ERP systems, web analytics, and IoT devices, ensuring a seamless flow of data into the platform.

**Security and Compliance Tier**: Enforces data access policies, authentication, encryption, and audit trails to ensure data security and compliance with regulations like GDPR or HIPAA.

**Data Governance Tier**: Tools and services that manage data cataloging, quality control, lineage tracking, and metadata management to maintain high data integrity and usability across the platform.
```

```admonish example title="Real-time Data Processing System for IoT"
**Presentation Tier**: A real-time dashboard displaying metrics, alerts, and analytics derived from IoT device data, enabling operational teams to monitor performance and respond to events as they occur.

**Business Logic Tier**: Stream processing services that apply real-time analytics, pattern recognition, and decision-making logic to incoming data streams, triggering automated responses or alerts based on predefined criteria.

**Data Access Tier**: Services that manage access to real-time data streams and historical data, ensuring efficient data retrieval for real-time and historical trend analyses.

**Data Ingestion Tier**: Microservices that handle the ingestion of high-velocity data streams from thousands of IoT devices, ensuring data is reliably captured, pre-processed, and routed to the appropriate services for further processing.

**Data Storage Tier**: Time-series databases optimized for storing and querying high-velocity, time-stamped data from IoT devices alongside data lakes or warehouses for longer-term storage and more complex analysis.

**Cache Tier**: In-memory data stores that cache critical real-time analytics and frequently queried data to ensure rapid access for real-time decision-making and dashboard updates.

**Integration Tier**: Integration with external systems and services, such as weather data APIs, geolocation services, or third-party analytics platforms, enriching IoT data with additional context for more sophisticated analytics.

**Security Tier**: Implements robust security protocols for device authentication, data encryption in transit and at rest, and fine-grained access controls to protect sensitive IoT data and analytics results.

**Data Quality and Governance Tier**: Automated tools and services that continuously monitor data quality, perform anomaly detection, and ensure that data flowing through the system adheres to defined governance policies and standards.
```

These examples demonstrate how n-tier architecture can be tailored to meet the specific needs of data-intensive applications, enabling data engineers and analytics teams to build scalable, flexible, and secure systems that support complex data processing and analytics workflows.

## Use Case

This use case continues to build on top of the use cases presented in the [two-tier](./two_tier_architecture.md#use-case) and [three-tier](./three_tier_architecture.md#use-case) architecture use cases.

### Architectural Evolution

Upon completing the last phase of the migration plan and deprecating the Legacy DWH Aurora Postgres instance, [Opetence Inc.](../../../use-cases/opetence/opetence_inc.md)'s data team now manages two main Aurora Postgres instances: the **Data Engineering Aurora Postgres instance (DE)** and the **Data Analytics Aurora Postgres instance (DA)**.

The DE instance is composed of one database managing live Operations data, one database for each external data partner that needs a direct connection to deliver their data, and one Staging database containing cleaned, cleansed, masked, and anonymized data from operational data (internal) and third-party data (external). The DA database consumes the Staging data through a foreign server, so dbt can consume it to create the data marts and reports. The Tableau server connects to the DA database to consume data from the data marts.

### Proposal and Implementation Plan

Now that the primary security concerns have been solved, the data engineering team has set new plans to reduce costs and optimize and modernize the data infrastructure.

```admonish tldr title="Workflow Orchestration"
Airflow should trigger and monitor 100% of the pipelines, including Airbyte and dbt tasks. In a combined effort with the DevOps team, the data engineering team now maintains a self-deployed Apache Airflow platform.
```

```admonish tldr title="Operational Data Replication"
The data engineering team now maintains a self-deployed Airbyte platform, which is also a combined effort with the DevOps team. Nightly Airbyte tasks are triggered and monitored by Airflow, which consumes the operational data into an S3 bucket. Many transformation tasks clean, cleanse, mask, and anonymize the raw data in the S3 bucket, before making them available in the Staging database. No PII or sensitive data can now reach the DE instance. Storing raw and intermediate data in S3 also reduced considerably the RDS costs.
```

```admonish tldr title="External Data Sources"
The team discovered that several data partners, including Segment and Braze, could deliver their data directly to S3 buckets. To manage this influx of data, Airflow orchestrates pipelines that clean, mask, and anonymize the incoming raw data within these S3 buckets. However, to minimize the impact on the Data Engineering (DE) instance, the pipeline that makes the cleaned data available in the Staging database runs only a few times daily. For critical data partners like Appsflyer, Stripe, SAP, and Google Analytics, Fivetran remains the primary integration tool, but for others like Intercom and Google Sheets, the team has transitioned to Airbyte. Customer Data Platforms (CDP), such as Segment and Customer Engagement Platforms (CEP), such as Braze, and other external sources generate a significant volume of data. By storing this data in S3, the team has significantly reduced data storage costs.
```

```admonish tldr title="Data Transformations"
On the data engineering side, many transformations are performed using Python and Bash scripts, which Airflow executes using the PythonOperator and BashOperator, respectively. Some transformations required more resources (CPU, memory, or disk space) than the Airflow environment could provide, so they were converted to containerized scripts deployed to AWS ECS or AWS Lambda functions. On the analytics side, dbt was deployed to AWS ECS, so Airflow can manage it using custom ECS operators.
```

```admonish tldr title="Live Operations Monitoring"
A bespoke microservice was created to manage live operations data. The microservice consumes data from many message queues (AWS SQS) and internal and external APIs, such as e-commerce platforms and voucher partners. The processed data is stored in an Operational Data Store (ODS), where Tableau and other visualization and operations monitoring tools connect to.
```

```admonish tldr title="Metadata Management & Data Lineage"
The data engineering team now maintains a DataHub instance deployed to AWS EKS. DataHub is a modern data catalog that enables end-to-end data discovery, observability, and governance. Despite the platform's many uses, the team will only use the lineage and data discovery features, integrating S3 buckets, RDS databases, Airflow, dbt, and Tableau. Future projects will enable data quality, observability, and governance features.
```

```admonish tldr title="Data Visualization and Exploration"
To enable the company, especially the product teams and business analysts, to explore the data in the marts, a Redash instance was deployed to AWS EC2.
```

### Alignment with N-Tier Architecture Principles

The described use case aligns with an N-Tier data architecture through its structured and layered approach to managing data and operational processes, each with a designated purpose and function, contributing to a scalable, flexible, and maintainable system. This architecture enables clear separation of concerns, enabling independent development, testing, and maintenance of each layer.

```admonish tldr title="Data Layer"
The use of multiple Aurora Postgres instances for different purposes (DE for data engineering tasks and DA for data analytics) embodies the data tier, where raw and processed data are stored and managed. The inclusion of an S3 bucket for raw and intermediate data storage further diversifies the data storage strategy, optimizing costs and performance.
```

```admonish tldr title="Application Logic Layer"
The orchestration of data workflows with Apache Airflow, transformation tasks with dbt, and data integration with Airbyte represents the application logic layer. This tier is responsible for processing data, executing business logic, and ensuring data is appropriately transformed and available for analytical purposes. The use of containerized scripts and AWS ECS for resource-intensive tasks exemplifies the scalability and flexibility of this tier.
```

```admonish tldr title="Presentation Layer"
The utilization of Tableau and Redash for data visualization, exploration, and reporting embodies the presentation layer, where processed and analyzed data is made accessible to end-users in an understandable and interactive format.
```

```admonish tldr title="Metadata Management & Data Lineage"
Implementing DataHub for metadata management and data lineage introduces an additional tier focused on data discovery and lineage. This layer enhances the overall architecture by providing tools for understanding data origins, transformations, and usage, which is crucial for maintaining data quality and compliance.
```

```admonish tldr title="Live Operations Monitoring"
The creation of a custom microservice for managing live operations data, which interfaces with various data sources and stores processed data in an ODS, represents an extension of the application logic tier, tailored explicitly for real-time operational needs.
```

Please note that, even with all these updates, the company would benefit more, with probably a lower price, from implementing a proper data lake, data warehouse architecture, or a combination of both. For instance, a data lake approach would clearly and logically structure the data in the S3 buckets, and the adoption of a data warehouse solution would free the data engineering team from the hassle of administrating so many Postgres instances and offer the analytics team a modern and specialized platform for data analysis and marts creation. These and many more architectures will be discussed in detail later on.
