```admonish warning title="Page under construction"
:construction:
```

# Two-Tier Architecture

```admonish tip title="Two-Tier Architecture"
Two-tier architectures balance simplicity and separation of concerns, making them suitable for applications where the direct client-server model suffices.
However, for more complex applications requiring greater scalability, flexibility, and separation of concerns, developers might opt for multi-tier architectures such as three-tier or n-tier models.
```

Two-tier architecture in the context of data systems is a client-server model that divides the system into two main layers or tiers: the client tier (presentation layer) and the server tier (data layer).
This architecture is a step towards separating concerns, which improves scalability and manageability compared to single-tier systems.

Characteristics of Two-Tier Architecture:

* **Client Tier**: This is the front-end layer where the user interface resides. The client application handles user interactions, presents data to the users, and may perform some data processing. It communicates directly with the server tier for data operations.
* **Server Tier**: This tier consists of the server that hosts the database management system (DBMS). It is responsible for data storage, retrieval, and business logic processing. The server tier interacts with the client tier to serve data requests and execute database operations.
* **Direct Communication**: In a two-tier architecture, the client application communicates directly with the database server without intermediate layers. This direct communication can simplify the architecture but might limit scalability and flexibility in more complex applications.
* **Scalability**: While two-tier architecture offers better scalability than single-tier by separating the client and server, it still faces challenges in scaling horizontally, especially as the number of clients increases.
* **Maintenance**: Updates and maintenance might need to be performed separately on both tiers, but the clear separation makes it easier to manage than a single-tier system.

Examples of Two-Tier Architecture in Data Systems:

```admonish example title="Desktop Database Applications"
A typical example of a two-tier architecture is a desktop application that connects directly to a database server. Applications like Microsoft Access, where the application on the user's desktop interacts with a centralized database server, are typical examples. This setup allows users to query and manipulate data stored on a remote server while using a local, user-friendly interface.
```

```admonish example title="Small Business Web Applications"
Small to medium-sized web applications, such as an internal web application for inventory management, can be built on a two-tier architecture. The web browser serves as the client tier, interacting with a web server that directly queries a backend database for inventory data.
```

```admonish example title="Enterprise Resource Planning (ERP) Systems"
In smaller implementations, an ERP system might employ a two-tier architecture where the client software (installed on user workstations) directly accesses the central database server for all data storage and business logic operations.
```

```admonish example title="Personal Finance Management Tools"
A personal finance tool that runs on a user's device and connects to a bank's database server for transaction data can be considered a two-tier system. The client software provides the interface and some local processing, while the server handles account data and transaction history.
```

```admonish example title="Point-of-Sale (POS) Systems"
In simpler setups, a POS system might use a two-tier architecture where the POS terminal (client) interacts directly with a central database server for transaction processing, inventory management, and sales tracking.
```

## Use Case

```admonish tip title="Opetence Inc."
This use case explores [Opetence Inc.](../../use-cases/opetence/opetence_inc.md)'s data management and architecture approach before the data team existed. At this time, the "analytics team" was essentially one product/business manager who set up the initial data structure. The upcoming use case risks and recommendations might be seen as the kind of changes a data engineer would propose after joining the company, aiming to improve its data handling and security.
```

### Current Architecture

Prior to the creation of the data team, a manager in the product team independently created all the data infrastructure: one **Aurora Postgres** instance, one **EC2** instance for the **Tableau** server, and a **dbt** project integrated into **Fivetran** transformations workflows. That's impressive for someone with no technical background, but the unsupervised work led to severe infrastructure risks, as presented in the company's profile.

Beyond orchestrating dbt model runs, the **Fivetran** was the primary ETL tool of the company, extracting data from many data partners, such as Google (Google Analytics and Google Ads), Facebook Ads, Braze customer engagement data, and many tech data partners used in the operation of the e-commerce platform, such as vouchers partners. The tool also loads data from Google Sheets spreadsheets into the database. All the data was loaded into the Aurora Postgres instance in a database called `data_warehouse`. That was the only database in use and will be referred to as the **Legacy DWH**. The database was publicly exposed so the Tableau instance could connect to it.

The Legacy DWH was connected to the company's microservices databases through a foreign server using a **Postgres data wrapper** (`fdw_postgres`). Fivetran would then periodically run multiple dbt models, transforming operational and third-party data into a schema called `data_marts`. Data and security professionals might be screaming now, but the architecture consisted of a *publicly exposed database containing PII and sensitive data to which third-party platforms could connect*.
Despite being called a "data warehouse," the database contained **near real-time data** for different Operations dashboards. The Operations dbt models would run every 5 minutes.

### Alignment with Two-Tier Architecture

The scenario described can be considered a variation of the two-tier architecture, with some elements that expand beyond the traditional definition. Here's a breakdown of how it aligns with and diverges from classic two-tier architecture:

**Alignment with Two-Tier Architecture**:

* **Client-Server Model**: The analytics team (`client`) interacts directly with the Aurora Postgres instance (`server`). This direct interaction is a hallmark of two-tier architecture, where *the client accesses the database server without intermediary layers*.
* **Data Transformation and Analysis**: The analytics team uses dbt models to transform data and create data marts within the same Aurora Postgres database instance. This is similar to business logic being processed in the server tier and is consistent with two-tier architecture.
* **Direct Connection to Visualization Tools**: Connecting Tableau directly to the data marts within the Aurora Postgres instance for visualization also aligns with the two-tier model, where the client application (Tableau) directly accesses the data layer.

**Expansions Beyond Traditional Two-Tier**:

* **Data Ingestion Automation**: Using Fivetran to automatically load data from various sources into the Aurora Postgres instance introduces an element of automation and integration that isn't typically a focus in classic two-tier descriptions. This aspect leans towards more sophisticated data pipelines and ETL processes, often part of more layered architectures.
* **Real-Time Data Monitoring**: The requirement for near real-time operations monitoring implies a level of dynamic data handling and updating that may exceed the simplicity often associated with two-tier systems. This aspect suggests a need for real-time data processing and analysis capabilities that are more characteristic of advanced data architectures.

While the core of the described scenario—direct interaction between the analytics team (client) and the Aurora Postgres instance (server)—fits the two-tier architecture model, the automated data ingestion and real-time monitoring aspects introduce complexities that are often addressed with more layered architectural approaches. Therefore, this scenario could be seen as a two-tier architecture at its foundation, with extensions that incorporate elements typically found in more advanced, multi-tier architectures.

### Identifying Architectural Risks and Challenges

However, while this setup facilitates direct data manipulation and reporting, it does introduce several challenges and potential issues:

* **Live Operational Systems Performance**: Using foreign schemas or database links in dbt models to directly connect to production operational microservices databases to create data marts introduces several risks and challenges. This approach can lead to performance issues, as *querying live operational databases directly can put a significant load on these systems*, potentially impacting their primary function. There's also a higher risk of data inconsistency and latency in the analytics outputs, as these connections rely on live data that might change mid-query. Security concerns arise since this method can expose sensitive operational databases to a broader range of access points, increasing the vulnerability to data breaches or unauthorized access.
* **Performance Bottlenecks**: Having all transformations, data loading, and analytics operations directly on the Aurora Postgres instance can lead to performance bottlenecks. Frequent loading and complex SQL queries for transformations and data mart creation can strain the database, affecting its responsiveness and the performance of applications relying on it, such as Tableau dashboards.
* **Security and Access Control**: Direct access to the database for multiple tools and the analytics team can pose significant security risks, especially if sensitive or personally identifiable information (PII) is involved. Ensuring proper access controls and preventing unauthorized access becomes challenging when multiple clients interact directly with the database.
  * **Fivetran and Tableau Access**: These tools, which have direct access to the database, might not always adhere to the principle of least privilege, potentially exposing sensitive data.
  * **Analytics Team Access to Raw Data**: Having unrestrained access to raw data, including PII, increases the risk of data breaches and non-compliance with data protection regulations (e.g., GDPR, HIPAA).
* **Data Governance and Quality**: Creating marts directly from raw operational data complicates governance, as analytics users and BI tools share the same database with sensitive, non-anonymized data. It's also a good practice to clean and cleanse the operational data separately from marts pipelines.
* **Scalability Issues**: As data volume grows and the number of data sources increases, the system may struggle to scale efficiently. The direct and constant load on the Aurora instance might not sustainably support larger datasets or more complex analytics requirements.
* **Lack of Isolation Between Operational and Analytical Workloads**: Mixing operational and analytical workloads in a single database instance can lead to resource contention, where analytical queries compete with operational transactions for CPU, memory, and I/O resources, potentially degrading the performance of both workloads.
* **Data Warehouse Purpose**: A data warehouse is, by definition, composed of **historical data**. Some extreme cases might justify updating it more than once daily to capture updates to historical data, which the data sources may have made to the previous day's data or older. Still, it should never be designed to store source data constantly. It's improbable that a data warehouse would ever need to contain data from the current day; a different database should store and handle Operations and other real-time data.

### Strategic Recommendations for Architectural Improvement

* **Implement a Data Lake or Data Warehouse**: Consider introducing an intermediate storage layer, such as a data lake or a dedicated data warehouse, to decouple raw data ingestion from transformations and analytics workloads. This can help manage performance, improve security, and enhance scalability.
* **Operational Systems Replications**: Use a dedicated migration tool like AWS DMS, Airbyte, or Fivetran to replicate data from operational systems to a data lake or warehouse before processing it for analytics. This practice isolates the analytical workload from operational databases, provides data consistency, enhances security, and improves overall system resilience and scalability.
* **Data Governance Framework**: Establish a robust data governance framework with clear policies on data access, quality, security, and compliance. Implement role-based access control (RBAC) to ensure users and applications only have access to the data they are authorized to use.
* **Implement Data Masking or Anonymization for PII**: For sensitive or PII data, employ data masking, anonymization, or pseudonymization techniques before making the data available to the analytics team or third-party tools.
* **Monitoring and Optimization**: Regularly monitor the performance of the database and the analytics processes. Use query optimization, indexing, and partitioning strategies to effectively improve performance and manage workload demands.

Adopting these recommendations can help mitigate the identified problems, leading to a more secure, scalable, and performant data architecture.
