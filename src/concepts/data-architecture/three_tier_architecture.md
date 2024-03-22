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

[Opetence Inc.](../../use-cases/opetence/opetence_inc.md) expands the data team by hiring two data engineers. The engineers warn the company about the critical issues described in the previous use case and their possible economic and legal consequences. They are authorized to create an Aurora Postgres instance (Data Engineering instance) to store raw and third-party data.

Fivetran now loads data directly from microservices' databases, third-party data (Google Analytics, Facebook Ads, etc.), and some Google Sheets files onto the instance in a database named Fivetran.
Some data partners can also store data directly in the DE instance, each in its exclusive database (e.g., Braze database).

The data engineering team cleans and anonymizes the data and makes it available in the DE instance in a database called Staging.
The staging data is organized in schemas (`order_service`, `product_service`, etc., and `google_analytics`, `facebook_ads`, etc.).
The team makes some of these schemas available as external schemas in the Analytics Aurora Postgres instance.
The analytics team has usage permissions to see the data structure but can't select from it.

The analytics team transforms the external data in the Analytics database using dbt, creating the "marts."
Tableau still has access to the Analytics database, but there's no raw data or PII anymore.

Only the microservices data needed for near real-time operations monitoring are frequently fetched into the Operations database in the DE instance, using a self-deployed Airbyte platform connected directly to the microservices' databases.
The migrations tasks are not of type full load and only maintain the time window needed for monitoring.
A dbt model runs in the Operations database, transforming the data into the desired format for monitoring purposes.

### Alignment with Three-Tier Architecture Principles

The revised use case provides a clearer depiction of a three-tier architecture within a data-centric environment, with distinct separation and specialization at each layer:

* **Data Layer (Tier 1)**: The "Data Engineering (DE) instance" serves as the foundational layer. It comprises various databases for different data sources:
  * The **Fivetran database** for data loaded from microservices, third-party sources like Google Analytics and Facebook Ads, and Google Sheets files.
  * **Exclusive databases** for data from specific partners like Braze, ensuring data segregation and security.
* **Application Logic Layer (Tier 2)**: This tier is responsible for data processing, cleaning, and preparation:
  * The **Staging database** within the DE instance, where cleaned and anonymized data is organized into schemas based on their source or service (e.g., `order_service`, `product_service`, `google_analytics`, `facebook_ads`).
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

### Identifying Persistent Architectural and Operational Challenges

The data engineering team understands the current setup is not optimal, and the company is still far from migrating to a better solution, but separating data and application logic tiers was a win.
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

### Suggestions

Should Opetence Inc. choose not to transition to a modern data architecture, such as a hybrid data lake and data warehouse approach, the data engineering team still has options to enhance the current setup by employing [microservices architecture](./microservices_architecture.md) and existing database systems.
It's important to recognize that although this modified approach addresses certain critical issues from the prior setup, it does not represent an ideal or fully optimized solution.
A more integrated approach combining aspects of data lakes and data warehouses would more effectively resolve these challenges, offering greater security, maintainability, efficiency, and cost-effectiveness.

Here are some changes and enhancements that could be considered:

* **Microservices for Data Processing**: Transitioning the existing Python code for data processing from MWAA to microservices deployed on ECS could address the issues with resource limitations and failures. This approach aligns with the company's DevOps expertise, allowing for more reliable and scalable data processing. Airflow could trigger these ECS tasks, providing a more robust solution for data cleansing, anonymization, and preparation before ingestion into the analytics database.
* **Optimized Data Models**: Reviewing and optimizing the data models within the dbt framework is crucial. Given the issues with Aurora Postgres instances crashing due to poorly designed models, optimizing these models could lead to significant improvements in stability and performance. This might involve simplifying the models, reducing unnecessary complexity, and ensuring they are efficiently designed for the queries they support.
* **API Gateway for Data Access**: Implementing an API Gateway to manage access to the data, especially for Tableau, could improve security and efficiency. This gateway could provide a controlled access point to the cleansed and anonymized data, potentially through external tables in the data lake, facilitating a more stable and secure connection for Tableau and other BI tools.

By leveraging these strategies, the data team at Opetence Inc. can significantly improve the existing data architecture's performance, scalability, and security without immediately resorting to a data lake or data warehouse solution.
These enhancements can be realized using the current Aurora Postgres instances and the flexibility offered by a microservices architecture.
However, it's important to note that while these improvements can address some of the critical issues, they may not be as efficient, scalable, or cost-effective as adopting a more modern data architecture, such as a data lake or data warehouse.

Looking ahead, while the immediate security concerns have been addressed, it's crucial for the team to advocate for migrating to a modern data architecture.
The current setup may struggle to keep pace with business demands and scalability requirements for data usage.
Should the data team successfully communicate the importance and benefits of transitioning to the architecture proposed in the [Layered Data Lake Architecture](./data_lake_architecture_layers.md#use-case) chapter, the migration could be achieved within a few months.
Failure to do so might result in prolonged efforts to adjust the existing architecture, potentially leading to a loss of trust in the data team's capabilities and its eventual dissolution.

```admonish todo
Structure the Use Case as:

Introduction to the Use Case and Current Architectural Evolution:
Briefly recap the journey from the previous architecture to the current state, emphasizing the transition towards a more structured approach.

Alignment with Three-Tier Architecture Principles:
Discuss how the new changes align with the foundational principles of a Three-Tier Architecture, such as separation of concerns and scalability.

Deviations from Ideal Three-Tier Architecture:
Identify where and how Opetence Inc.'s current architecture diverges from the ideal model, focusing on areas that fall short of best practices.

Challenges Faced by the Data Engineer:
Detail the obstacles and resistance the data engineer encountered in advocating for architectural changes, highlighting the effort required to achieve even incremental improvements.

Strategic Improvements and Their Impact:
Assess the improvements made, such as the introduction of the DE instance and staging areas, and discuss their impact on data management and security.

Identifying Persistent Architectural and Operational Challenges:
Examine ongoing challenges within the current architecture, such as potential scalability issues, data silos, or governance concerns.

Contrasting with a Sound Three-Tier Architecture:
Present a well-defined model of a Three-Tier Architecture, detailing how each layer should function and interact with the others. Then, contrast this with Opetence Inc.'s implementation, pointing out specific shortcomings and areas for further improvement.

Recommendations for Bridging the Gap:
Offer concrete recommendations for how Opetence Inc. could evolve its architecture towards the ideal model, suggesting actionable steps and considerations for a more robust and scalable data infrastructure.
```
