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

The same company as the two-tier architecture [use case](./two_tier_architecture.md#use-case), Opetence Inc., expands the data team by hiring a data engineer.
The data engineer warns the company about the issues described in the previous use case and is authorized to create an Aurora Postgres instance (Data Engineering instance) to store raw and 3rd party data.

Fivetran now loads data directly from microservices' databases, third-party data (Google Analytics, Facebook Ads, etc.), and some Google Sheets files onto the instance in a database named Fivetran.
Some data partners can also store data directly in the DE instance, each in its exclusive database (e.g., Braze database).

The data engineer cleans and anonymizes the data and makes it available in the DE instance in a database called Staging.
The staging data is organized in schemas (`order_service`, `product_service`, etc., and `google_analytics`, `facebook_ads`, etc.).
The data engineer makes some of these schemas available in the Analytics Aurora Postgres instance as external schemas.
The analytics team has usage permissions to see the data structure but can't select from it.

The analytics team transforms the external data in the Analytics database using dbt, creating the "marts."
Tableau still has access to the Analytics database, but there's no raw data or PII anymore.

Only the microservices data needed for near real-time operations monitoring are frequently fetched into the Operations database in the DE instance, using a self-deployed Airbyte platform connected directly to the microservices' databases.
The migrations tasks are not of type full load and only maintain the time window needed for monitoring.
A dbt model runs in the Operations database, transforming the data into the desired format for monitoring purposes.

The revised use case provides a clearer depiction of a three-tier architecture within a data-centric environment, with distinct separation and specialization at each layer:

* **Data Layer (Tier 1)**: The "Data Engineering (DE) instance" serves as the foundational layer. It comprises various databases for different data sources:
  * The **Fivetran database** for data loaded from microservices, third-party sources like Google Analytics and Facebook Ads, and Google Sheets files.
  * **Exclusive databases** for data from specific partners like Braze, ensuring data segregation and security.
* **Application Logic Layer (Tier 2)**: This tier is responsible for data processing, cleaning, and preparation:
  * The **Staging database** within the DE instance, where cleaned and anonymized data is organized into schemas based on their source or service (e.g., order_service, product_service, google_analytics, facebook_ads).
  * Selected schemas are made available in the **Analytics Aurora Postgres instance** as external schemas, which the analytics team can access but not modify, ensuring data integrity and security.
* **Presentation Layer (Tier 3)**: This tier focuses on data consumption, analysis, and visualization:
  * The analytics team uses **dbt** within the Analytics database to transform external schema data into "marts" tailored for specific analytical needs.
  * **Tableau** connects to these data marts in the Analytics database for reporting and visualization, free from raw data or PII, addressing previous security concerns.

**Operational Data Handling**:
* The **Operations database** within the DE instance is designated explicitly for monitoring near real-time operations. Data required for this purpose is fetched from microservices databases using **Airbyte**, a flexible, self-hosted data integration platform. This setup provides a dedicated space for operational data, separate from the analytical processing environment, enhancing system efficiency and focus.

**Advantages of This Revised Architecture**:

* **Enhanced Data Security and Governance**: The clear separation between raw data ingestion, processing, and consumption layers helps enforce stricter access controls and data governance policies, particularly by segregating sensitive and PII data from broader access.
* **Improved Scalability and Flexibility**: This architecture allows for more scalable data processing and analysis workflows. By isolating data transformation and analytics processes, it's easier to scale resources up or down as needed for each tier without impacting other areas of the system.
* **Dedicated Monitoring and Operations**: The introduction of a specialized Operations database for monitoring ensures that operational analytics don't burden the main analytical processes, allowing for optimized performance in both areas.
* **Cleaner Data for Analytics**: By cleaning and anonymizing data before it reaches the Analytics instance and further transforming it with dbt, the analytics team works with high-quality data, leading to more reliable insights and reporting.

This use case is a more refined example of three-tier architecture in a data environment, with clear boundaries between data ingestion and storage, data processing and staging, and data analysis and presentation.
It addresses many of the performance, security, and scalability concerns presented in the original scenario, illustrating the benefits of a well-structured data architecture in supporting efficient and secure data operations.

The data engineer understands the current setup is not optimal, and the company is still far from migrating to a better solution, but separating data and application logic tiers was a win.
However, identifying flaws in the current data management scenario is crucial for making a solid case for migration to a more structured and scalable solution like a data lake or data warehouse.
Here are some potential risks and issues that could be present in the current scenario:

* **Data Silos**: Disparate data systems can lead to data silos, making it difficult to access, share, and analyze data across different departments or teams. This lack of integration can hinder collaboration and decision-making.
* **Scalability Issues**: The current infrastructure may not be scalable enough to handle increasing volumes of data, leading to performance bottlenecks and reduced efficiency.
* **Data Quality Concerns**: Ensuring data quality can be challenging without a centralized system. Inconsistent data formats, duplicates, and errors can proliferate, affecting the reliability of data insights.
* **Limited Data Governance**: The absence of a robust data governance framework can lead to issues with data security, privacy, and compliance, especially with regulations like GDPR or HIPAA.
* **Inefficient Data Processing**: Relying on manual processes or outdated technology for data integration, transformation, and loading (ETL) can be time-consuming and error-prone.
* **Analysis and Reporting Limitations**: Limited capabilities for advanced analytics, real-time reporting, and data visualization can restrict the ability to derive actionable insights from data.
* **Data Security Vulnerabilities**: The current setup might have security gaps, making sensitive data susceptible to breaches and unauthorized access.
* **Disaster Recovery Concerns**: An inadequate backup and disaster recovery strategy could mean that critical data is at risk of being lost or compromised in the event of a system failure or cyberattack.
* **High Maintenance Costs**: In terms of infrastructure and manpower, maintaining multiple disparate systems can be more costly than managing a centralized data repository.
* **Limited Support for New Technologies**: The existing infrastructure may not support the integration of modern data processing and analytics tools, hindering the adoption of cutting-edge technologies like AI and machine learning.

Addressing these issues in a comprehensive assessment can help build a compelling argument for migrating to a more modern data management solution.
Highlighting the potential for improved efficiency, better decision-making, and enhanced data security can be particularly persuasive in gaining approval for the transition.

If the company is not ready to adopt a data lake or data warehouse solution and prefers to continue utilizing Aurora Postgres reserved instances, the data engineer can still implement several strategies to optimize the current architecture, leveraging the flexibility of microservices and the existing database infrastructure.
Here are some changes and enhancements that could be considered:

* **Database Partitioning and Sharding**: Implement database partitioning to divide large tables into smaller, more manageable pieces, improving query performance. Sharding, or distributing data across multiple databases or instances, can also help balance the load and improve scalability.
* **Microservices for Data Processing**: Utilize microservices architecture for specific data processing tasks. For instance, microservices can be created to perform data cleansing, transformation, and anonymization tasks before the data is ingested into staging or analytics databases. This can offload some processing from the databases and improve overall system efficiency.
* **Caching Strategies**: Implement caching layers within the data architecture to store frequently accessed data and reduce direct database hits. This can be particularly effective for data required for near real-time operations monitoring, reducing latency and improving response times.
* **Data Archiving**: Develop an archiving strategy to move older, less frequently accessed data out of the primary databases to free up resources and maintain performance. This archived data can be stored in a more cost-effective storage solution and still be accessible if needed for historical analysis.
* **Optimized Data Models**: Review and optimize the data models used within the databases to ensure they are efficient for the queries and analyses performed. This might include denormalizing some data structures, adding appropriate indexes, or optimizing query designs.
* **Database as a Service (DBaaS) Enhancements**: Explore advanced features offered by Aurora Postgres and other DBaaS solutions, such as performance insights, automated scaling, and query optimization, to enhance database performance and management.
* **Service Mesh for Microservices**: Implement a service mesh to manage communication between microservices, providing enhanced control over data flow, security, and monitoring. This can help ensure that data processing microservices work together seamlessly and efficiently.
* **API Gateway for Data Access**: Introduce an API gateway as an intermediate layer between clients (like Tableau) and data sources. The API gateway can manage data requests, enforce access controls, and provide an additional abstraction layer, reducing direct database access.
* **Data Validation and Quality Services**: Develop microservices dedicated to continuous data validation and quality checks. This will ensure that data entering the system meets predefined quality standards, helping maintain data integrity across the system.
* **Load Balancing and Auto-Scaling**: Utilize load balancing and auto-scaling features to dynamically adjust resources based on demand, particularly for data processing microservices. This ensures that the system can handle peak loads efficiently without over-provisioning resources.

By leveraging these strategies, the data engineer can significantly enhance the performance, scalability, and security of the existing data architecture without the immediate need for a data lake or data warehouse solution.
This can be done efficiently using the current Aurora Postgres instances and the flexibility offered by microservices architecture.
However, adopting a data lake or data warehouse architecture will always be a better solution, as it was for this specific use case.