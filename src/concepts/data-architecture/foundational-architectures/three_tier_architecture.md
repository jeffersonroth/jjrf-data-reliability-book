<title>Foundational Architectures: Three-Tier Architecture.</title>
<meta name="description" content="Three-Tier Foundational Architecture.">
<meta name="author" content="Jefferson Roth">
<meta name="keywords" content="architecture, data architecture, foundational architecture, three-tier, Opetence Inc., use cases, use case">

# Three-Tier Architecture

```admonish warning title="Page under construction"
:construction:
```

```admonish tip title="Three-Tier Architecture"
This model enhances application performance, scalability, maintainability, and security by segregating functionalities into distinct layers that interact with each other through well-defined interfaces.
```

Three-tier architecture is a widely adopted software design pattern that separates applications into three logical and physical computing tiers: the Presentation tier, the Application (or Logic) tier, and the Data tier.

Three-Tier Architecture Components:

* **Presentation Tier (Client Tier)**: This is the topmost level of the application and is the interface through which users interact with the application. It's responsible for presenting data to users and interpreting user commands. This tier can be a web browser, a desktop application, or a mobile app.
* **Application Tier (Logic Tier/Business Logic Tier)**: The middle tier is an intermediary between the presentation and data tiers. It contains the application's business logic and rules, which process user requests, perform operations on the data, and determine how data should be structured or presented. This tier can run on a server and be developed in any language, such as Rust, Go, or Python.
* **Data Tier (Database Tier)**: The bottom tier consists of the database management system (DBMS), which is responsible for storing, retrieving, and managing the data within the system. It can include relational databases such as MySQL and PostgreSQL or non-relational databases like MongoDB.

Advantages of Three-Tier Architecture:

* **Scalability**: Each tier can be scaled independently, allowing for more efficient resource use and the ability to handle increased loads by scaling the most resource-intensive components.
* **Maintainability**: Separation of concerns makes updating or modifying one tier easier without affecting others, simplifying maintenance and updates.
* **Security**: Layered architecture allows for more granular control over access and security. Security measures can be applied independently at each tier, such as securing sensitive business logic in the application tier and implementing database access controls in the data tier.
* **Flexibility and Reusability**: The application tier can serve as a centralized location for business logic, making it easier to reuse logic across different applications and integrate with different databases or presentation tiers.

```admonish example title="Online Retail Platform"
Consider an online retail platform:

* **Presentation Tier**: The e-commerce website and mobile app through which customers browse products, add items to their shopping cart, and place orders.
* **Application Tier**: The backend server that processes customer orders, manages inventory, applies business rules (like discounts, taxes, stock availability), and handles user authentication and authorization.
* **Data Tier**: The database(s) that store product information, customer data, order history, inventory levels, and other persistent data required by the application.

In this scenario, the three-tier architecture allows the platform to handle user interactions via the web or mobile interfaces efficiently, process business logic on the server, and manage data in a secure and organized manner, facilitating a seamless and scalable e-commerce experience.
```

## Use Case

[Opetence Inc.](../../../use-cases/opetence/opetence_inc.md) expands the data team by hiring two data engineers. The engineers warn the company about the critical issues described in the previous use case and their possible economic and legal consequences. They are authorized to create an Aurora Postgres instance (Data Engineering instance) to store raw and third-party data, separating the **Data Layer** and the **Application Logic Layer**.

### Proposal and Implementation Plan

The team agrees that the old Aurora Postgres (**Legacy DWH**) instance must be deprecated and plans the migration in 3 phases:

1. **Phase 1**: Create the **Data Engineering Aurora Postgres instance (DE)** to store operational and third-party data and migrate the Legacy DWH instance into the same virtual private cloud (VPC). In this phase, the Legacy DWH would be migrated as is, and some minor security actions would be made as manage database users (`fivetran_user`, `tableau_user`, `braze_user`, etc.) permissions through a service. This phase also will deploy the Airbyte platform for operational data migrations.
2. **Phase 2**: Clean, cleanse, mask, and anonymize the data within the DE instance. The data would be available in the Legacy DWH as foreign schemas through a foreign server, so only the `dbt_user` could select from it. The data would also be available in the **Data Analytics Aurora Postgres instance (DA)**, where the legacy dbt models should start being migrated. *The DA instance would not be productive at this point*.
3. **Phase 3**: All data sources will be available as foreign schemas in the DA instance so the dbt models can create the data marts. Tableau will connect to the DA instance. The Legacy DWH instance will be deprecated and removed.

Once Phase 3 is completed, we'll have the following:

* **Operational Data**: Operational data should be stored in the **Data Engineering Aurora Postgres instance (DE)** in a database called `staging`. A self-deployed **Airbyte** platform directly connected to the microservices' databases should load the data into the database.
* **Third-Party Data**: Fivetran should continue to load third-party data from sources like Google Analytics, Facebook Ads, etc., and some Google Sheets files into a database named `fivetran_ext_db` in the DE instance. Additionally, certain data partners were expected to store their data directly in the DE instance, each within their own exclusive database within the DE instance, such as the `braze_ext_db` database for Braze.
* **Real-Time Data**: Data crucial for near real-time operations monitoring should be frequently ingested into the `operations` database within the DE instance through foreign servers. The foreign tables will be consumed by dbt models specially designed for the `operations` database, maintaining only the necessary data window for effective monitoring. The dbt models already existed in the legacy dbt project but must be a separate project now.
* **Staging Data**: The data engineering team should clean and anonymize the operational and external data, organizing it in the `staging` database in the DE instance. This staging data, structured into schemas corresponding to different services (e.g., `order_service`, `product_service`) and external sources (e.g., `google_analytics`, `facebook_ads`), was intended to be made available as external schemas within the **Data Analytics Aurora Postgres instance (DA)**. Access permissions would allow the analytics team to view the data structure but not perform selections directly from it.
* **Analytics Data**: Aggregated and analytics data will be stored in the DA instance, especially the data marts. **Tableau** access to the `analytics` database will remain an OBCD connection using an exclusive user for Tableau (`tableau_user`) that *does not have access to raw, sensitive, or personally identifiable information (PII) data*.

### Alignment with Three-Tier Architecture Principles

The use case provides a clearer three-tier architecture within a data-centric environment, with distinct separation and specialization at each layer:

* **Data Layer (Tier 1)**: The **DE instance** serves as the foundational layer. It comprises various databases for different data sources:
  * The `fivetran_ext_db`, `braze_ext_db`, and other databases for data from specific partners ensure data segregation and security.
  * The `staging` database within the DE instance, where raw operational data is organized into schemas based on their source or service (e.g., `order_service_airbyte`, `product_service_airbyte`).
* **Application Logic Layer (Tier 2)**: This tier is responsible for data processing, cleaning, and preparation:
  * The `staging` database within the DE instance, where cleaned and anonymized data is organized into schemas based on their source or service (e.g., `order_service`, `product_service`, `google_analytics`, `facebook_ads`).
  * Selected DE's `staging` schemas are made available in the **DA instance** as **external** (foreign) schemas, specifically in the `analytics` database. The analytics team can access the tables' metadata (column names, column types, total rows, etc.) but not select from or modify them, ensuring data integrity and security. In the `analytics` database, these foreign schemas will be available as `{schema}_ext` (e.g., `order_service_ext`, `product_service_ext`, `google_analytics_ext`, `facebook_ads_ext`).
  * The analytics team uses **dbt** within the `analytics` database to transform external schema data into **data marts** tailored for specific analytical needs.
* **Presentation Layer (Tier 3)**: This tier focuses on data consumption, analysis, and visualization:
  * **Tableau** connects to the data marts in the `analytics` database for reporting and visualization, free from raw data or PII, addressing previous security concerns.

**Operational Data Handling**:

* The `operations` database within the DE instance is explicitly designated for monitoring near real-time operations. The data required for this purpose is fetched from microservices databases using **dbt** through external schemas. This setup provides a dedicated space for operational data separate from the analytical processing environment, enhancing system efficiency and focus, even though it increases the security and performance risks discussed in the previous chapter ([Two-Tier Architecture](../foundational-architectures/two_tier_architecture.md#use-case)).
* As we'll see in the next chapter ([N-Tier Architecture](../foundational-architectures/n_tier_architecture.md#use-case)), for Operations monitoring, an exclusive microservice, or set of microservices, could manage an [**Operational Data Store (ODS)**](../operational_data_stores.md) separate from the DE and DA Aurora Postgres instances.

**Advantages of This Revised Architecture**:

* **Enhanced Data Security and Governance**: The clear separation between raw data ingestion, processing, and consumption layers helps enforce stricter access controls and data governance policies, particularly by segregating sensitive and PII data from broader access.
* **Improved Scalability and Flexibility**: This architecture allows for more scalable data processing and analysis workflows. By isolating data transformation and analytics processes, it's easier to scale resources up or down as needed for each tier without impacting other areas of the system.
* **Dedicated Monitoring and Operations**: The introduction of a specialized Operations database for monitoring ensures that operational analytics don't burden the main analytical processes, allowing for optimized performance in both areas.
* **Cleaner Data for Analytics**: By cleaning and anonymizing data before it reaches the DA instance and further transforming it with dbt, the analytics team works with high-quality data, leading to more reliable insights and reporting.

This use case is a more refined example of three-tier architecture in a data environment, with clear boundaries between data ingestion and storage, data processing and staging, and data analysis and presentation. It addresses many of the performance, security, and scalability concerns presented in the original scenario, illustrating the benefits of a well-structured data architecture in supporting efficient and secure data operations.

### Identifying Persistent Architectural and Operational Challenges

The data engineering team understands the current setup is not optimal, and the company is still far from migrating to a better solution, but separating data and application logic tiers was a win. However, identifying flaws in the current data management scenario is crucial for making a solid case for migration to a more structured and scalable solution like a data lake and data warehouse. Here are some potential risks and issues that could be present in the current scenario:

* **Scalability Issues**: The current infrastructure may not be scalable enough to handle increasing data volumes, processing, and active users, leading to performance bottlenecks and reduced efficiency.
* **Data Quality Concerns**: Ensuring data quality can be challenging without a centralized system. Inconsistent data formats, duplicates, and errors can proliferate, affecting the reliability of data insights.
* **Limited Data Governance**: The absence of a robust data governance framework can lead to issues with data security, privacy, and compliance, especially with regulations like GDPR or HIPAA.
* **Inefficient Data Processing**: Relying on manual processes or outdated technology for data integration, transformation, and loading (ETL) can be time-consuming and error-prone.
* **Analysis and Reporting Limitations**: Limited capabilities for advanced analytics, real-time reporting, and data visualization can restrict the ability to derive actionable insights from data.
* **Data Security Vulnerabilities**: The current setup might have security gaps, making sensitive data susceptible to breaches and unauthorized access.
* **Disaster Recovery Concerns**: An inadequate backup and disaster recovery strategy could cause critical data to be lost or compromised in the event of a system failure or cyberattack.
* **High Maintenance Costs**: In terms of infrastructure and human resources, maintaining multiple disparate systems can be more costly than managing a centralized data repository.
* **Limited Support for New Technologies**: The existing infrastructure may not support the integration of modern data processing and analytics tools, which can impede the adoption of advanced technologies like AI and machine learning.

Addressing these issues in a comprehensive assessment can help build a compelling argument for migrating to a more modern data management solution. Highlighting the potential for improved efficiency, better decision-making, and enhanced data security can be particularly persuasive in gaining approval for the transition.

### Suggestions

Should Opetence Inc. choose not to transition to a modern data architecture, such as a hybrid data lake and data warehouse approach, the data engineering team still has options to enhance the current setup by employing [microservices architecture](../modern-architectural-paradigms/microservices_architecture.md) and existing database systems. It's important to recognize that although this modified approach addresses certain critical issues from the prior setup, it does not represent an ideal or fully optimized solution. A more integrated approach combining aspects of data lakes and data warehouses would more effectively resolve these challenges, offering greater security, maintainability, efficiency, and cost-effectiveness.

Here are some changes and enhancements that could be considered:

* **Microservices for Data Processing**: Complex transformations and scripts, including **dbt models**, should be deployed to **Amazon Elastic Container Service (ECS)**, so **Airflow** could trigger them using **ECS Operators** (e.g., `EcsRunTaskOperator`) instead of running them directly with Python or Bash Operators, addressing current issues with resources limitations and recurring errors. This approach aligns with the company's DevOps expertise, allowing for more reliable and scalable data processing.
* **Optimized Data Models**: Reviewing and optimizing the data models within the dbt framework is crucial. Given the issues with Aurora Postgres instances crashing due to poorly designed models, optimizing these models could lead to significant improvements in stability and performance. This might involve simplifying the models, reducing unnecessary complexity, and ensuring they are efficiently designed for the queries they support.

By adopting these strategies, the data team at Opetence Inc. can significantly improve the existing data architecture's performance, scalability, and security without immediately resorting to a data lake or data warehouse solution. These enhancements can be implemented using the current Aurora Postgres instances and the flexibility offered by a microservices architecture. However, it's important to note that while these improvements can address some of the critical issues, they may not be as efficient, scalable, or cost-effective as adopting a more modern data architecture, such as a data lake or data warehouse.

Looking ahead, while the immediate security concerns have been addressed, it's crucial for the team to advocate for migrating to a modern data architecture. The current setup may struggle to keep pace with business demands and scalability requirements for data usage. Should the data team successfully communicate the importance and benefits of transitioning to the architecture proposed in the [Layered Data Lake Architecture](../data-lakes/layers.md#use-case) chapter, the migration could be achieved within a few months. Failure to do so might result in prolonged efforts to adjust the existing architecture, potentially leading to a loss of trust in the data team's capabilities and its eventual dissolution.
