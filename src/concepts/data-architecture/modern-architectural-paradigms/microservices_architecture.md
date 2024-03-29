# Microservices Architecture in Data Systems

```admonish warning title="Page under construction"
:construction:
```

Microservices architecture is a design approach that structures an application as a collection of loosely coupled services that implement business capabilities.
In the context of data systems, this architectural style offers a way to break down complex data processing tasks into smaller, manageable services that can be developed, deployed, and scaled independently.

**Characteristics of Microservices in Data Systems**:

* **Decomposition**: Data processing tasks are decomposed into smaller, independent services, each focused on a specific aspect of data handling, such as ingestion, transformation, validation, or querying.
* **Autonomy**: Each microservice is developed, deployed, and managed independently, allowing teams to use the best tools and languages suited for each service's specific requirements. This autonomy also facilitates independent scaling, enhancing the system's ability to handle varying loads on different components.
* **Decentralized Governance**: Microservices encourage decentralized decision-making, with teams responsible for their services from development to production. This includes choosing technology stacks, deployment strategies, and scaling mechanisms.
* **Agility**: With independently deployable services, updates, and new features can be rolled out quickly without impacting the entire system. This agility supports rapid iteration and continuous improvement in data processing capabilities.
* **Fault Isolation**: Failures in one service have limited impact, reducing the risk of system-wide outages. This isolation improves the data system's overall resilience.
* **Scalability**: Microservices can be scaled horizontally, meaning that instances of services can be increased or decreased based on demand. This is particularly beneficial for data systems where different components may experience varying loads.

**Implementing Microservices in Data Systems**:

* **Data Ingestion Microservices**: Handle the intake of data from various sources, ensuring that data is ingested efficiently and reliably into the system.
* **Data Transformation Microservices**: Perform transformations on the ingested data, such as cleaning, normalization, enrichment, and aggregation, preparing it for analysis or storage.
* **Data Storage Microservices**: Manage interactions with data storage solutions, abstracting the complexities of data persistence and retrieval.
* **Data Query and API Microservices**: Provide interfaces for querying and accessing processed data, serving the needs of analytics tools, applications, and end-users.
* **Data Monitoring and Logging Microservices**: Monitor the health, performance, and usage of data services, logging important events and metrics for analysis and optimization.

**Considerations**:

While microservices offer numerous benefits, they also introduce challenges such as increased complexity in service coordination, data consistency management, and the need for robust monitoring and logging.
Organizations adopting microservices for their data systems must invest in automation, DevOps practices, and effective communication and collaboration tools to manage these challenges effectively.

By leveraging microservices architecture, data systems can become more flexible, scalable, and resilient, enabling organizations to meet the demands of modern data processing and analytics workloads.

Here are some examples illustrating how microservices architecture can be applied in data systems, enhancing flexibility, scalability, and resilience:

```admonish example title="E-commerce Platform Analytics"
An e-commerce platform uses microservices to handle its vast and varied data analytics needs.
The architecture is broken down as follows:

* **Ingestion Microservices**: Separate services are designed to ingest data from different sources, such as website activity, order management systems, and customer feedback channels. Each service is optimized for its data source, ensuring efficient data capture.
* **Transformation Microservices**: Data from ingestion services is routed to transformation services, where it undergoes cleansing, normalization, and enrichment. For instance, a service might be dedicated to enriching order data with customer demographic information, enhancing the depth of analytics.
* **Aggregation Microservice**: This service aggregates processed data to create meaningful metrics, such as daily sales totals, average order values, and customer lifetime value, which are essential for business insights.
* **Storage Microservices**: Tailored services store different types of data, such as raw event logs in a data lake or structured metrics in a data warehouse. Each service ensures that data is stored efficiently and is easily accessible.
* **API Microservices**: These services provide APIs for querying analytics data, serving the needs of internal teams, third-party partners, or customer-facing dashboards. They ensure data is delivered securely and swiftly.
```

```admonish example title="Real-time Financial Market Data Processing"
A financial services company employs microservices to process and analyze real-time market data for its trading platforms:

* **Market Data Ingestion Microservices**: Dedicated microservices ingest real-time data streams from various stock exchanges, each optimized for the exchange's specific data format and transmission protocol.
* **Normalization Microservice**: A microservice normalizes the ingested market data, ensuring data format and structure consistency, which is crucial for accurate analysis and decision-making.
* **Analytics Microservice**: This service performs real-time analytics on the normalized data, calculating key financial indicators like moving averages, volatility indexes, and relative strength indexes, which traders rely on for making informed decisions.
* **Alerting Microservice**: This service generates alerts for significant market events or indicator thresholds based on predefined rules, enabling prompt responses to market conditions.
* **Historical Data Microservice**: This service manages the storage and retrieval of historical market data, allowing for back-testing of trading strategies and historical trend analysis.
```

```admonish example title="IoT Data Processing for Smart Cities"
A smart city initiative uses microservices to process data from various IoT devices deployed across the city:

* **Device Data Ingestion Microservices**: Individual microservices collect data from different types of IoT devices, such as traffic cameras, environmental sensors, and smart meters. Each service handles the devices' specific data formats and communication protocols.
* **Data Enrichment Microservice**: This service enriches IoT data with additional context, such as adding location data to sensor readings or correlating traffic camera footage with event schedules.
* **Analytics Microservices**: Separate microservices analyze enriched IoT data for various purposes, like traffic flow optimization, energy usage analysis, and environmental monitoring. Each analytics service is tailored to specific city management objectives.
* **Data Integration Microservice**: This service integrates processed data into city management systems, ensuring that insights derived from IoT data are actionable and can inform city planning, emergency response, and public services.
* **Citizen Engagement Microservice**: A microservice provides a platform for citizen engagement, allowing residents to access city data, report issues, and receive updates, fostering transparency and community involvement.
```

In each example, the microservices architecture enables the system to handle diverse data types, sources, and processing requirements with agility and scalability.
By compartmentalizing functionalities into microservices, these systems can rapidly adapt to changing demands, scale components independently, and ensure high availability and resilience.

When the data engineering team operates as a central entity within an organization, it can develop a range of microservices tailored to enhance data governance, quality, and infrastructure management.
Here are some examples of microservices that such a team might create:

```admonish example title="Data Quality Microservices"
* **Data Validation Service**: This microservice can check the quality of incoming data against predefined rules and constraints. It can be triggered as data enters the system, ensuring that only data meeting the quality standards is allowed through.
* **Anomaly Detection Service**: Implementing algorithms to detect outliers or unusual patterns in the data, this service can flag potential issues for review, helping to maintain the overall quality and integrity of data in the system.
* **Data Profiling Service**: This microservice could analyze datasets to provide metadata about data quality, such as completeness, uniqueness, and frequency of values. This information can be vital for understanding data characteristics and identifying areas for improvement.
```

```admonish example title="Schema and Database Management Microservices"
* **Schema Management Service**: This service would handle tasks related to the creation, alteration, and deletion of database schemas, ensuring that changes are tracked and managed systematically. It can also enforce standards and naming conventions across the database environment.
* **Permission Management Service**: Managing access controls and permissions for various databases and data warehouses, this microservice ensures that only authorized users and applications can access or modify data, enhancing security and compliance.
* **External Schema Integration Service**: Specifically for data warehouses that support external schemas (like AWS Redshift), this microservice can manage the integration and mapping of external data sources, making them accessible for querying and analysis without data duplication.
```

```admonish example title="Infrastructure Monitoring and Management Microservices"
* **DMS (Data Migration Service) Monitoring Service**: For organizations using AWS DMS or similar tools for data migration, this microservice can monitor the health, performance, and statistics of migration tasks, providing alerts and insights to ensure smooth data migrations.
* **Airflow Monitoring Service**: Designed to monitor the health and performance of Airflow workflows, this service can track job successes, failures, and run times, offering insights and alerts to optimize data pipeline reliability and efficiency.
* **Data Lake/Warehouse Monitoring Service**: This microservice would focus on the health and performance of data lakes and warehouses, monitoring aspects like query performance, storage utilization, and cost optimization to ensure these critical data storage resources operate efficiently.
```

By developing these microservices, the data engineering team can provide robust, scalable, and modular solutions to manage and maintain the data infrastructure, improving data quality, security, and operational efficiency across the organization.

## Use Case

### Architectural Evolution

Adapting its infrastructure to fit a three-tier architecture led [Opetence Inc.](../../../use-cases/opetence/opetence_inc.md) to include many microservices, such as Apache Airflow and dbt, deployed to AWS Elastic Container Service (ECS) and running in serverless Fargate instances. Non-resource-intensive, simple, and quick Python and Bash scripts continued to run using Airflow's `PythonOperator` and `BashOperator`, respectively. Tasks not fitting this category would run AWS Lambda or ECS + Fargate.

The obvious advantage of maintaining fully containerized transformations is the possibility of not being dependent on specific libraries, library versions, and even languages. Each transformation would only access the resources needed for its completion, such as database access and API authentication. These microservices can evolve 100% independently of Airflow and each other.

Airbyte deployment to ECS wasn't yet available at the time of this use case, so it was deployed to AWS Elastic Kubernetes Service (EKS) using their official Helm chart. The details of how the company worked with the DevOps team to deploy Airbyte to EKS, deploy Airflow, dbt, and many microservices to ECS, and run them on Fargate will be available in the Use Cases section.

```admonish todo
- Diagram with cross-dependent DAGs.
```

### Alignment with Microservices Architecture Principles

```admonish tldr title="Decomposition"
Pipelines are decomposed into smaller independent tasks.

The same pipeline (Airflow DAG) can now replicate data from one data source to an S3 bucket (Airbyte) and then have tasks cleansing, cleaning, masking, and anonymizing the data (`LambdaInvokeFunctionOperator` + `LambdaFunctionStateSensor`) in Parquet files.

A subsequential Airflow DAG would wait (`ExternalTaskSensor`) for the transformed Parquet files, then trigger (`ECSRunTaskOperator`) tasks to upsert the data into the Staging database in the DE Aurora Postgres instance.
A subsequential Airflow DAG would then wait for all DAGs to upserting data to Staging for the sources/schemas a dbt model is dependent on, then trigger the dbt model task (custom `DbtRunTaskOperator` built on top of `ECSRunTaskOperator`).

Another DAG would wait for all dbt tasks a report depends on in their respective DAGs to finish, then trigger the tasks that create the reports and publish them to their respective targets (email, S3 buckets, FTP servers, etc.).
```

```admonish tldr title="Autonomy"
Each microservice is developed, deployed, and managed independently, allowing teams to use the best tools and languages suited for each service's specific requirements.

For **Airbyte**, the DevOps team can change the service deployment (`airbyte` repo), such as migrating the authentication method from Basic HTTP to an OIDC authentication method using Okta Single Sign-On (SSO), while the data engineering team can bump Airbyte's app and Helm charts versions. The team can also independently use Terraform to manage Airbyte sources and targets (e.g., Postgres databases, S3 buckets, Google Analytics, etc.) in the data engineering infrastructure repo (`de-infrastructure` repo).

For **dbt**, the data engineering team can manage the ECS deployment process or profiles (`de-dbt` repo), while the analytics teams can manage the models.
```

```admonish tldr title="Decentralized Governance"
Microservices encourage decentralized decision-making, with teams responsible for their services from development to production.

**Airflow** and **dbt** use different Python versions. Many transformation scripts written in Python depend on different packages, which are often incompatible.

Some transformations benefit from tools that are not always written in Python, and the ability to encapsulate them in containerized applications with all their dependencies facilitates and accelerates development. For example, many Parquet modular encryption tools are available as CLI tools or support Rust, C, Java, and even JavaScript APIs.
```

```admonish tldr title="Agility"
With independently deployable services, updates and new features can be rolled out quickly without impacting the entire system. The analytics team, for example, can alter dbt models independently without depending on the data engineering team for approval, so the team can quickly respond to business demands. This is unless a new model is added and needs to be orchestrated by Airflow or DAGs managing existing models change their dependencies or schedule.
```

```admonish tldr title="Fault Isolation"
Failures in one service have limited impact, reducing the risk of system-wide outages.
```

```admonish tldr title="Scalability"
Microservices can be scaled horizontally, meaning that instances of services can be increased or decreased based on demand.
```

This use case demonstrates how microservices architecture enabled Opetence Inc. to efficiently manage its data lifecycle in S3 and databases, from ingestion to transformation into marts and reports. All of that is orchestrated by one microservice: Apache Airflow.
