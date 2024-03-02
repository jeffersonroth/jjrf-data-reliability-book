# Data Architecture
> Data Architecture is about how the data is managed, from **collection**, **transformations**, **distribution**, and **consumption**.

It includes the models, policies, rules, and standards governing which data is collected and how it is stored, arranged, integrated, and put to use in data systems within the organization.

The data architecture aims to set standards for all data systems and the interaction between them. It also dictates and materializes the organization's understanding of its business in a Conceptual, Logical, and Physical level.

The Zachman Framework for enterprise architecture understands the data architecture in five layers:
1. Scope/Contextual: subjects and architectural standards important for the business.
2. Business/Conceptual: business entities, their attributes, and associations.
3. System/Logical: how entities are related.
4. Technology/Physical: representation of a data design as implemented in a database management system.
5. Detailed Representations: databases.

## Conceptual Layer (CDM)
> Represents all **Business Entities**.

The **Conceptual Data Model** (CDM) consists of the **Business Entities**, like **User**, **Branch**, and **Product**. The business entities (or business objects) carry *attributes* (name, identifiers, timestamps, etc.), and *associations* (relationships) with other business entities.
The complete set of business entities represents the business relationships.

From a data architecture perspective, these business entities are represented in a **Conceptual Schema**, which consists of a map of **concepts** (business entities) and their **relationships** in a database, normally in a **Data Structure Diagram** (DSD). It may also include **Enterprise Data Modelling** (EDM) outputs like entity–relationship diagrams (ERDs), XML schemas (XSD), and an enterprise-wide data dictionary.

The conceptual schema describes the semantics of an organization and represents a series of assertions about its nature. It describes the objects of significance (business entities) the organization is interested in collecting information, their characteristics (attributes), and the associations between each pair of objects of significance (relationships). Please note that the conceptual schema is not the actual database design, and is represented in different abstraction layers.

Examples:
- Each ORDER must be from one and only one USER.
- Each ORDER contains one or more PRODUCTS.
- Each ORDER contains products from one or more BRANCHES.

## Logical Layer (LDM)
> Represents the logic and how the entities are related.

The **Logical Data Model** (LDM), also known as the Domain Model, represents the abstract structure of a domain of information, expressed independently of a particular database management product or storage technology (physical data model), but in terms of data structures such as relational tables and columns, object-oriented classes, or XML tags.

Once validated and approved, the logical data model can become the basis of a physical data model and form the design of a database.

## Physical Layer (PDM)
> The representation of a data design as implemented, or intended to be implemented, in a database management system.

The **Physical Data Model** (PDM) typically derives from a logical data model (LDM), though it may be reverse-engineered from a given database implementation. A complete physical data model will include all the database artifacts required to create relationships between tables or to achieve performance goals, such as indexes, constraint definitions, linking tables, partitioned tables, or clusters.

### CDM vs. LDM vs. PDM
#### Data Constructs
- **Conceptual Data Model** (CDM): uses general high-level data constructs from which Architectural Descriptions are created in non-technical terms.
- **Logical Data Model** (LDM): includes entities (tables), attributes (columns/fields), and relationships (keys). Is independent of technology (platform, DBMS).
- **Physical Data Model** (PDM):  includes tables, columns, keys, data types, validation rules, database triggers, stored procedures, domains, and access constraints as primary keys and indices for fast data access.

#### Naming Conventions
- **Conceptual Data Model** (CDM): uses non-technical names, so that executives and managers at all levels can understand the data basis of Architectural Description.
- **Logical Data Model** (LDM): uses business names for entities & attributes.
- **Physical Data Model** (PDM): uses more defined and less generic specific names for tables and columns, such as abbreviated column names, limited by the database management system (DBMS) and any company-defined standards.

## Modern Data Architecture
A modern approach to data architecture, extensively adopted by StartUps, reduces, restricts, or understands the data architecture as the implementation of a Data Warehouse, a Data Lake + Data Warehouse, or a Data Lakehouse architecture, consisting of the data sources plus two or three tiers:
- Bottom/Data Tier: data warehouse server with functional gateway (ODBC, JDBC, etc.). It may also include the data lake.
- Middle/Application Tier: houses the business logic used to process user inputs (OLAP Servers, Snowflake, Amazon Redshift, Databricks Data Lakehouse Platform, Apache Spark, etc.).
- Top/Presentation Tier: front-end tools (Power BI, Tableau, etc.).