A Data Warehouse (DWH), also known as Enterprise Data Warehouse (EDW) is a central repository of information that can be analyzed to make more informed decisions. 

Data flows into a data warehouse from Data Lake, transactional systems, relational databases, and other sources, typically on a regular cadence. Business analysts, data engineers, data scientists, and decision makers access the data through Business Intelligence (BI) tools, SQL clients, and other analytics applications.

 

Goals
Data Warehouse Architecture
Data Sources
Warehouse
Metadata
Summarized data
End-User access Tools
Two-Tier Architecture
Three-Tier Architecture
Reconciled Layer
Middle Tier
AWS Redshift & Snowflake
Databricks Lakehouse Platform
Data Lakehouse vs Data Warehouse vs Data Lake
OLAP Servers
Relational OLAP Servers (ROLAP)
Multidimensional OLAP Servers (MOLAP)
Hybrid OLAP Servers (HOLAP)
OLAP Servers options
Data Modeling Methodologies
Kimball (Bottom-Up)
Advantages
Disadvantages
Inmon (Top-Down)
Advantages
Disadvantages
Hybrid
Vault
Bus Architecture
Maturity Stages
Key Components of a Data Warehouse
References
Goals
When implementing a data warehouse, the main goals are to achieve:

Consistency: maintain a uniform format to all collected data, making it easier for corporate decision-makers to analyze and share data insights with their colleagues. Standardizing data from different sources also reduces the risk of error in interpretation and improves overall accuracy.

Decision-making: successful business leaders develop data-driven strategies and rarely make decisions without consulting the facts. Data warehousing improves the speed and efficiency of accessing different data sets and makes it easier for corporate decision-makers to derive insights that will guide the business and marketing strategies that set them apart from their competitors.

Improving: allow business leaders to quickly access the organization historical activities and evaluate initiatives that have been successful — or unsuccessful — in the past. This allows executives to see where they can adjust their strategy to decrease costs, maximize efficiency and increase business results.

Single Source of Truth: the whole company would benefit on having a single source of truth, specially when there are multiple data sources to a common business dimension.

Data Warehouse Architecture

There are several data warehouses architecture approaches available. Data warehouses would have in common some key components:

Data Sources
In most architectures approaches, it’s the Source Layer, or Data Source Layer, and consists on all the data sources the Warehouse Layer will consume.

Operational System: is a method used in data warehousing to refer to a system that is used to process the day-to-day transactions of an organization.

In our case, that’s the data coming from our internal services (user service, commerce service, etc.). It’ll be available in the Data Lake, in parquet format.

Flat Files System: is a system of files in which transactional data is stored, and every file in the system must have a different name.

In the current DWH implementation, that’s the data coming from external providers as Braze and Segment. I’ll be also available in the Data Lake, in parquet format.

Warehouse
In most architectures approaches, it’s the Warehouse Layer, or Data Warehouse Layer, and consists on all the data stored in RDBMS database with available gateway access (ODBC, JDBC, etc.). It also contains the metadata, and some degree of data summarization, and business logic applied, which differentiate an DWH database from a Production database.

Metadata
Metadata is the road-map to a data warehouse, it defines the warehouse objects, and acts as a directory. This directory helps the decision support system to locate the contents of a data warehouse.

In the current DWH implementation, there’s no metadata management tool yet in use. The only metadata we’re applying is when the data was last updated in the Data Lake (dl_updated_at), when the data first entered the Data Warehouse (dwh_created_at), and when it was last updated (dwh_updated_at).

It should soon be extended to:

A description of the Data Warehouse structure, including the warehouse schema, dimensions, hierarchies, data mart locations, contents, etc.

Operational metadata, which usually describes the currency level of the stored data (for example, active, archived or purged), and warehouse monitoring information (for example, usage statistics, error reports, audit, etc).

System performance data, which includes indices, used to improve data access and retrieval performance.

Information about the mapping from operational databases, which provides source RDBMSs and their contents, cleaning and transformation rules, etc.

Summarization algorithms, predefined queries, and reports business data, which include business terms and definitions, ownership information, etc.

Metadata management tool example.

Summarized data
The area of the data warehouse that maintains all the predefined lightly and highly summarized (aggregated) data. The main goal is to speed up query performance, and the summarized records are updated continuously as new information is loaded into the warehouse.

In the current DWH implementation, the data is being summarized directly in the Data Marts, using dbt (bottom-down approach). That means we do not have summarized data stored and available for BI teams to work with, nor have a Single Source of Truth applied at data warehouse layer.

End-User access Tools
The principal purpose of a data warehouse is to provide information to the business for strategic decision-making. These end-users interact with the warehouse using end-client access tools.

The examples of some of the end-user access tools can be:

Reporting and Query Tools

Application Development Tools

Executive Information Systems Tools

Online Analytical Processing Tools

Data Mining Tools

In our case, the only tool currently consuming the Data Marts, is Tableau.

Two-Tier Architecture
The current architecture of our data warehouse is close to a Two-Tier architecture. To reach a proper two-tier architecture, we still have to adopt a Data Staging solution, and a Metadata Management solution. The last great step to fully implement it, is to define how the data can be accessed by external tools.

A data staging solution in this context means to have data cleansed and available with a standard schema at the data warehouse level, before the data enters the data marts pipelines.

Once we fully migrate to this architecture (as a middle step to reach a Three-Tier architecture), our architecture will be as follows:


Data Source Layer: A data warehouse system uses a heterogeneous source of data. That data is stored initially to corporate relational databases or legacy databases, or it may come from an information system outside the corporate walls.

Data Staging Layer: The data stored to the source should be extracted, cleansed to remove inconsistencies and fill gaps, and integrated to merge heterogeneous sources into one standard schema. The ETLs can combine heterogeneous schemata, extract, transform, cleanse, validate, filter, and load source data into a data warehouse. Note that this can be achieved in two ways:

Having the Distillation Layer (Silver) in the Data Lake as the Data Staging Layer.

Creating a separated database within the Data Warehouse, or a separated database schema. Following the principle that all the data in the data warehouse should be cleaned and have high quality standards, a separated database should be preferred.

Data Warehouse Layer: Information is saved to one logically centralized individual repository: a data warehouse. The data warehouses can be directly accessed, but it can also be used as a source for creating data marts, which partially replicate data warehouse contents and are designed for specific enterprise departments. Metadata repositories store information on sources, access procedures, data staging, users, data mart schema, and so on.

Analysis Layer: In this layer, integrated data is efficiently, and flexibly accessed to issue reports, dynamically analyze information, and simulate hypothetical business scenarios. It should feature aggregated information navigators, complex query optimizers, and customer-friendly GUIs.

Three-Tier Architecture
Reconciled Layer
Once we fully implement a Two-Tier Architecture, the next step is to adopt a Three-Tier Architecture. For it it’s necessary to implement a Reconciled Layer, and a Middle Tier.

Once we fully implement the Reconciled Layer, our architecture will be as follows:


The Reconciled Layer sits between the source data and data warehouse. The main advantage of the reconciled layer is that it creates a standard reference data model for the whole company. At the same time, it separates the problems of source data extraction and integration from those of data warehouse population. In some cases, the reconciled layer is also directly used to accomplish better operational tasks, such as producing daily reports that cannot be satisfactorily prepared using the corporate applications or generating data flows to feed external processes periodically to benefit from cleaning and integration.

This architecture is especially useful for the extensive, enterprise-wide systems. A disadvantage of this structure is the extra file storage space used through the extra redundant reconciled layer. It also makes the analytical tools a little further away from being real-time.

Middle Tier
As the name of the architecture suggests, it consists of three tiers (levels):

Bottom Tier (Data): data warehouse server with functional gateway (ODBC, JDBC, etc.).

Middle Tier (Application): houses the business logic used to process user inputs. Example: OLAP Servers, Snowflake, Apache Redshift, Databricks Data Lakehouse Platform.

Top Tier (Presentation): front-end tools.

The Bottom and Top tiers were already discussed in details in the previous steps, so we only have left the implementation of the Middle Tier, very important to enable fast querying of the data warehouse. It is important to note the solutions to the middle tier are often referred as the Data Warehouse itself, but they’re only the Application tier/level in a complete data warehouse solution (It’s like saying Redshift is the DWH, when it’s just one part of the complete DWH solution).

Once we fully implement the Middle Tier, our architecture will be as follows:


One could argue that OLAP is dead, at least in the traditional format (solutions like Mondrian), and cloud/modern solutions should be applied to accompany business fast demand for data. In this sense, given costs restrictions, solutions like Apache Kylin seem to be a better approach (details below). When costs are less restricted, and/or data demands increase, other solutions like AWS Redshift, Snowflake, and Databricks Lakehouse are preferred/recommended.

AWS Redshift & Snowflake
AWS Redshift and Snowflake comparison available in this miro dashboard (to be migrated to Confluence soon).

Databricks Lakehouse Platform
It combines the ACID transactions and data governance of data warehouses with the flexibility and cost-efficiency of data lakes to enable business intelligence (BI) and machine learning (ML) on all data.

Data Lakehouse vs Data Warehouse vs Data Lake
Data in the data warehouse is easy to use, but harder to store. The opposite is true for the data lake: it’s easy to ingest and store data, but a pain to consume and query.

The data lakehouse has a layer design, with a warehouse layer on top of a data lake. This architecture, which enables combining structured and unstructured data, makes it efficient for business intelligence and business analysis. Data lakehouses provide structured storage for some types of data and unstructured storage for others while keeping all data in one place.

OLAP Servers
Relational OLAP Servers (ROLAP)
They use a relational or extended-relational DBMS to save and handle warehouse data, and OLAP middleware to provide missing pieces. They work primarily from the data that resides in a relational database, where the base data and dimension tables are stored as relational tables. This model permits the multidimensional analysis of data.

This technique relies on manipulating the data stored in the relational database to give the presence of traditional OLAP's slicing and dicing functionality.

Advantages
Can handle large amounts of information: the data size limitation of ROLAP technology is depends on the data size of the underlying RDBMS. So, ROLAP itself does not restrict the data amount.

RDBMS already comes with a lot of features. So ROLAP technologies, (works on top of the RDBMS) can control these functionalities.

Disadvantages
Performance can be slow: each ROLAP report is a SQL query (or multiple SQL queries) in the relational database, the query time can be prolonged if the underlying data size is large.

Limited by SQL functionalities: ROLAP technology relies on upon developing SQL statements to query the relational database, and SQL statements do not suit all needs.

Multidimensional OLAP Servers (MOLAP)
It is based on a native logical model that directly supports multidimensional data and operations. Data are stored physically into multidimensional arrays, and positional techniques are used to access them.

One of the significant distinctions of MOLAP against a ROLAP is that data are summarized and are stored in an optimized format in a multidimensional cube, instead of in a relational database. In MOLAP model, data are structured into proprietary formats by client's reporting requirements with the calculations pre-generated on the cubes.

Advantages
Excellent Performance: a MOLAP cube is built for fast information retrieval, and is optimal for slicing and dicing operations.

Can perform complex calculations: all evaluation have been pre-generated when the cube is created. Hence, complex calculations are not only possible, but they return quickly.

Disadvantages
Limited in the amount of information it can handle: Because all calculations are performed when the cube is built, it is not possible to contain a large amount of data in the cube itself.

Hybrid OLAP Servers (HOLAP)
It incorporates the best features of MOLAP and ROLAP into a single architecture. It saves more substantial quantities of detailed data in the relational tables while the aggregations are stored in the pre-calculated cubes. HOLAP also can drill through from the cube down to the relational tables for delineated data.

Advantages
It provides benefits of both MOLAP and ROLAP.

It provides fast access at all levels of aggregation.

It balances the disk space requirement, as it only stores the aggregate information on the OLAP server and the detail record remains in the relational database. So no duplicate copy of the detail record is maintained.

Disadvantages
HOLAP architecture is very complicated because it supports both MOLAP and ROLAP servers.

OLAP Servers options
Apache Kylin
Only supports MOLAP and Offline data storage modes. It supports both SQL and MDX queries, have RESTful API capabilities (also ODBC, and JDBC), and can be integrated/connect with Tableau (also Redash, Superset, Zeppelin, Qlik, and Excel).

It supports Real Time processing, partitioning, usage based optimizations, load balancing and clustering. It supports LDAP, SAML, Kerboros authentication.

Mondrian OLAP Server
Only supports ROLAP data storage modes. It supports MDX queries but not SQL, and have REST API capabilities. Does not natively connect with Tableau, but queries can be performed via Java APIs. It supports Real Time processing, and partitioning.

Data Modeling Methodologies
Being one of the most important topics of data warehouse design and architecture, the data modeling methodology choosing process is arduous and polemic, and will impact the whole design and implementation of the data warehouse solution.

Though not planned, or discussed, the current architecture of the data warehouse, is of type Kimball (bottom-up), which means the data marts are first formed based on the business requirements. There are lots of advantages and disadvantages of priming this approach over a top-down approach (or any of the hybrid or alternative methodologies).

Kimball (Bottom-Up)
The design of the Data Marts comes from the business requirements. The primary data sources are then evaluated, and an Extract, Transform and Load (ETL) tool is used to fetch data from several sources and load it into a staging area of the relational database server. Once data is uploaded in the  data warehouse staging area, the next phase includes loading data into a dimensional data warehouse model that is denormalized by nature. This model partitions data into the fact and dimension tables. Kimball dimensional modeling allows users to construct several star schemas to fulfill various reporting needs.


Kimball Approach to Data Warehouse Lifecycle.
Advantages
Fast to construct (quick initial phase): it is fast to construct as no normalization is involved, which means swift execution of the initial phase of the data warehousing design process.

Simplified queries: in a star schema, most data operators can easily comprehend it because of its denormalized structure, which simplifies querying and analysis.

Simplified business management: the data warehouse system footprint is trivial because it focuses on individual business areas and processes rather than the whole company. So, it takes less space in the database, simplifying system management.

Fast data retrieval: as data is segregated into fact tables and dimensions.

Smaller teams: a smaller team of designers and planners is sufficient for data warehouse management because data source systems are stable, and the data warehouse is process-oriented. Also, query optimization is straightforward, predictable, and controllable.

Deeper insights: it allows business intelligence tools to deeper across several star schemas and generates reliable insights.

Disadvantages
No Single Source of Truth: Data isn’t entirely integrated before reporting, so the idea of a single source of truth is lost.

Too prone to data irregularities: this is because in denormalization technique, redundant data is added to database tables.

Too difficult and expensive to add new columns: performance issues may occur due to the addition of columns in the fact table, as these tables are quite in-depth. The addition of new columns can expand the fact table dimensions, affecting its performance.

Can’t respond (well) to business changes: it is too difficult to alter the models.

Not BI-friendly: as it is business process-oriented, instead of focusing on the company as a whole, it cannot handle all the BI reporting requirements.

Inconsistent dimensional view: this model is not strong as top-down approach as dimensional view of data marts is not consistent as it is in Inmon approach.

In brief, the Kimball approach have a low start-up cost, is faster to deliver the first phase of the data warehouse design, is faster to release to production (first version), but is suitable for Tactical business decision support requirements (versus Strategic), and addresses individual business requirements (vs Enterprise-wide). Another important topic that derives from this methodology approach is the Data Warehouse Bus Architecture (described in next topics).

Inmon (Top-Down)
On the other hand, Bill Inmon, the father of data warehousing, came up with the concept to develop a data warehouse which identifies the main subject areas and entities the enterprise works with, such as customers, product, vendor, etc. Inmon’s definition of a data warehouse is that it is a “subject-oriented, nonvolatile, integrated, time-variant collection of data in support of management’s decisions”.

The model then creates a thorough, logical model for every primary entity. For instance, a logical model is constructed for products with all the attributes associated with that entity. This logical model could include many entities, including all the details, aspects, relationships, dependencies, and affiliations.

The Inmon design approach uses the normalized form for building entity structure, avoiding data redundancy as much as possible. This results in clearly identifying business requirements and preventing any data update irregularities. Moreover, the advantage of this top-down approach in database design is that it is robust to business changes and contains a dimensional perspective of data across data mart.

Next, the physical model is constructed, which follows the normalized structure. This Inmon model creates a Single Source of Truth for the whole business to consume. Data loading becomes less complex due to the normalized structure of the model. However, using this arrangement for querying is challenging as it includes numerous tables and links.

This Inmon data warehouse methodology proposes constructing data marts separately for each division, such as finance, marketing sales, etc. All the data entering the data warehouse is integrated. The data warehouse acts as a single data source for various data marts to ensure integrity and consistency across the enterprise.

Advantages
Single Source of Truth: the data warehouse acts as a unified source of truth for the entire business, where all data is integrated.

Very low data redundancy: there’s less possibility of data update irregularities, making the data warehouse ETL processes more straightforward and less susceptible to failure.

Great flexibility: it’s easier to update the data warehouse in case there’s any change in the business requirements or source data.

BI-friendly: It can handle diverse company-wide reporting requirements.

Disadvantages
Increasing complexity: it increases as multiple tables are added to the data model with time.

Skilled Human Resources: resources skilled in data warehouse data modeling are required, which can be expensive and challenging to find.

Slow setup: the preliminary setup and delivery are time-consuming.

Expert management: this approach requires experts to manage a data warehouse effectively.

In brief, the Inmon have a high start-up cost, requires more time to be in production and meet business needs (very large projects with a very broad scope), and requires a bigger team os specialists, but is more suitable for for systems and business changes, better integrates with the whole company, favors Strategic business decision support requirements (vs Tactical), and facilitates Business Intelligence development.

Hybrid
In a hybrid model, the data warehouse is built using the Inmon model, and on top of the integrated data warehouse, the business process oriented data marts are built using the star schema for reporting.

The hybrid approach provides a Single Source of Truth for the data marts, creating a highly flexible solutions from a BI point of view.

Based on the Hub and Spoke Architecture, the hybrid design methodology can also make use of Operational Data Stores (ODS),  integrating and cleaning data from multiple data sources. The information is then parsed into the actual Data Warehouse.

Hybrid methods will normally keep the data in the 3rd normal form, reducing redundancy. Although normal relational database is not efficient for BI reports. Data marts for specific reports can then be built on top of the data warehouse solution.

When the data is denormalized, all the data available is pulled (as advocated by Inmon) while using a denormalized design (as advocated by Kimball). One example is the Carry Forward method.

Another hybrid methodology is the Data Vault, discussed below.


Example of a Hybrid Methodology approach.
Vault
The Vault Data Modeling is a hybrid design, consisting of the best of breed practices from both 3rd normal form and star-schema.

It is not a true 3rd normal form, and breaks some of the rules that 3NF dictates. It is a top-down architecture with bottom-up design, geared to be strictly a data warehouse. It is not geared to be end-user accessible, which when built, still requires the user of a data mart or star-schema based release are for business purposes.

Data Vault data modeling breaks data into a small number of standard components – the most common of which are Hubs, Links and Satellites. 

Hubs are entities of interest to the business. They contain just a distinct list of business keys and metadata about when each key was first loaded and from where.

Links connect Hubs and may record a transaction, composition, or other type of relationship between hubs. They contain details of the hubs involved (as foreign keys) and metadata about when the link was first loaded and from where.

Satellites connect to Hubs or Links. They are Point in Time: so we can ask and answer the question, “what did we know when?”. Satellites contain data about their parent Hub or Link and metadata about when the data was loaded, from where, and a business effectivity date.

The data model of the data warehouse is constructed using these components. These are:

Standard: each component is always constructed the same way.

Simple: easy to understand, and with a little practice, easy to apply them to model your system.

Connected: hubs only connect to links and satellites, links only connect to hubs and satellites, and satellites only connect to hubs or links.

Data Vault has staging, vault and mart layers. Star schemas live in the mart layer, each star schema exposes a subset of the vault for a particular group of users.  Typically, hubs and their satellites form dimensions, links and their satellites form facts.

A Data Vault complements the Data Lake and is a solution for organizations that need to integrate and add structure to the data held in the Data Lake.


Data Vault Modeling Methodology.
This is how our Data Warehouse Architecture would look like once the Data Vault Modeling Methodology is implemented:


Bus Architecture
… Inflow, Upflow, Downflow, Outflow and Meta flow.

Maturity Stages
…

Key Components of a Data Warehouse
Data Ingestion: allows connectors to get data from a different data sources and load into the Data Warehouse. The data will normally come from the Data Lake and External Sources connection (Fivetran), through multiple ETLs (Airflow, services, apps, ETL tools and platforms, etc.).

Data Storage: the data is stored in the data warehouse database, a relational database (RDBMS), like Postgres.

Data Governance: is a process of managing availability, usability, security, and integrity of data used in an organization.

Security: it needs to be implemented in every layer of the Data Warehouse. It includes setting up the data warehouse read-only by default, and setting up custom User Groups. It also includes the access to the databases (VPCs, VPNs, Whitelisting, etc.), strong and active DevOps monitoring and the enforcing of best practices in all levels of the data warehouse environment (data ingestion, data marts consumption, ETLs design, etc.).

Data Quality: it is an essential component of Data Warehouse architecture. Data is used to exact business value. Extracting insights from poor quality data will lead to poor quality insights.

Data Discovery: it is another important stage before you can begin preparing data or analysis. All this rely on good metadata, and data modeling.

Data Auditing: it helps to evaluate risk and compliance. Two major Data auditing tasks are tracking changes to the key dataset.

Tracking changes to important dataset elements.

Captures how/when/who changes to these elements.

Data Lineage: it deals with data’s origins. It mainly deals with where it movers over time and what happens to it. It eases errors corrections in a data analytics process from origin to destination. Some data modeling techniques may facilitate lineage in comparison to others (Vault vs Kimball vs Inmon).

Data Exploration: it is the beginning stage of data analysis. It helps to identify right dataset is vital before starting Data Exploration. All given components need to work together to play an important part in Data Warehouse building easily evolve and explore the environment.

References
Data Warehouse - AWS


Data Warehouse Architecture - javatpoint
Data Warehouse Architecture with Introduction, What is Data Warehouse, History of Data Warehouse, Data Warehouse Components, Operational Database Vs Data Warehouse etc.

www.javatpoint.com

Data Warehouse Architecture, Components & Diagram Concepts
This data warehouse architecture tutorial covers all the basic to advance stuff like definitions, characteristics, architectures, components, data marts, and more.

Guru99

Data Warehouse Architecture - GeeksforGeeks
A Computer Science portal for geeks. It contains well written, well thought and well explained computer science and programming articles, quizzes and practice/competitive programming/company interview Questions.

GeeksforGeeks

Data Warehouse Architecture: Traditional vs. Cloud
Data warehouse architecture is changing. Learn about traditional EDW vs. cloud-based architectures with lower upfront cost, improved scalability and performance.

Panoply

Kimball vs. Inmon in Data Warehouse Architecture

We will discuss about the Kimball vs. Inmon in data warehouse architecture and design approach. We also answer the question of how to choose Kimball or Inmon's architecture to build data warehouse.

zentut
Data Warehouse Concepts: Kimball vs. Inmon Approach

Inmon vs Kimball: Which data warehouse concept should you use to design a data warehouse. Find out in this blog.

Astera

Data vault modeling

Data vault modeling is a database modeling method that is designed to provide long-term historical storage of data coming in from multiple operational systems. It is also a method of looking at historical data that deals with issues such as auditing, tracing of data, loading speed and resilience to change as well as emphasizing the need to trace where all the data in the database came from. This means that every row in a data vault must be accompanied by record source and load date attributes, enabling an auditor to trace values back to the source. It was developed by Daniel (Dan) Linstedt in 2000.

Wikipedia

Data Warehousing concepts: Kimball vs. Inmon vs. Hybrid vs. Vault
Knowledge sharing with intelligence beyond rational...

Drazda

Data warehouse  12 reconciled data layers

Reconciled Data Layers during the ETL process

SlideShare

Full screen view
https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=c80f8aaea5bf58846b0125b460401fed8230c2d2


Data Warehousing - Metadata Concepts
Data Warehousing Metadata Concepts - Metadata is simply defined as data about data. The data that is used to represent other data is known as metadata. For example, the index of a book serves as a metadata for the contents in the book. In other words, we can say that metadata is the summarized data that leads us to detailed data. In te

Tutorialspoint
 

 