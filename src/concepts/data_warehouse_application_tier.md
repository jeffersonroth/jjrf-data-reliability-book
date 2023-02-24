# Data Warehouse Middle/Application Tier
> Houses the business logic used to process user inputs.

One could argue that OLAP is [dead](https://www.kdnuggets.com/2022/10/olap-dead.html), at least in the traditional format (solutions like Mondrian), and cloud/modern solutions should be applied to accompany business fast demand for data.

Given this book aims to explore business scenarios mostly common to startups, in this sense, given costs restrictions, solutions like Apache Kylin seem to be a better approach (details below). When costs are less restricted, and/or data demands increase, other solutions like AWS Redshift, Snowflake, and Databricks Lakehouse are preferred/recommended.

## Snowflake

## AWS Redshift
#TODO

## Snowflake vs AWS Redshift

## Databricks Lakehouse Platform
> It combines the ACID transactions and data governance of data warehouses with the flexibility and cost-efficiency of data lakes to enable business intelligence (BI) and machine learning (ML) on all data.

### Data Lakehouse vs Data Warehouse vs Data Lake
Data in the data warehouse is easy to use, but harder to store. The opposite is true for the data lake: it’s easy to ingest and store data, but a pain to consume and query.

The data lakehouse has a layer design, with a warehouse layer on top of a data lake. This architecture, which enables combining structured and unstructured data, makes it efficient for business intelligence and business analysis. Data lakehouses provide structured storage for some types of data and unstructured storage for others while keeping all data in one place.

## OLAP Servers
### Relational OLAP Servers (ROLAP)
> They use a relational or extended-relational DBMS to save and handle warehouse data, and OLAP middleware to provide missing pieces. They work primarily from the data that resides in a relational database, where the base data and dimension tables are stored as relational tables. This model permits the multidimensional analysis of data.

This technique relies on manipulating the data stored in the relational database to give the presence of traditional OLAP's slicing and dicing functionality.

#### Advantages
**Can handle large amounts of information**: the data size limitation of ROLAP technology is depends on the data size of the underlying RDBMS. So, ROLAP itself does not restrict the data amount.

RDBMS already comes with a lot of features. So ROLAP technologies, (works on top of the RDBMS) can control these functionalities.

#### Disadvantages
**Performance can be slow**: each ROLAP report is a SQL query (or multiple SQL queries) in the relational database, the query time can be prolonged if the underlying data size is large.

**Limited by SQL functionalities**: ROLAP technology relies on upon developing SQL statements to query the relational database, and SQL statements do not suit all needs.

### Multidimensional OLAP Servers (MOLAP)
> It is based on a native logical model that directly supports multidimensional data and operations. Data are stored physically into multidimensional arrays, and positional techniques are used to access them.

One of the significant distinctions of MOLAP against a ROLAP is that data are summarized and are stored in an optimized format in a multidimensional cube, instead of in a relational database. In MOLAP model, data are structured into proprietary formats by client's reporting requirements with the calculations pre-generated on the cubes.

#### Advantages
**Excellent Performance**: a MOLAP cube is built for fast information retrieval, and is optimal for slicing and dicing operations.

**Can perform complex calculations**: all evaluation have been pre-generated when the cube is created. Hence, complex calculations are not only possible, but they return quickly.

#### Disadvantages
**Limited in the amount of information it can handle**: Because all calculations are performed when the cube is built, it is not possible to contain a large amount of data in the cube itself.

### Hybrid OLAP Servers (HOLAP)
> It incorporates the best features of MOLAP and ROLAP into a single architecture. It saves more substantial quantities of detailed data in the relational tables while the aggregations are stored in the pre-calculated cubes. HOLAP also can drill through from the cube down to the relational tables for delineated data.

#### Advantages
- It provides benefits of both MOLAP and ROLAP.
- It provides fast access at all levels of aggregation.
- It balances the disk space requirement, as it only stores the aggregate information on the OLAP server and the detail record remains in the relational database. So no duplicate copy of the detail record is maintained.

#### Disadvantages
HOLAP architecture is very complicated because it supports both MOLAP and ROLAP servers.

### OLAP Servers options
#### Apache Kylin
Only supports MOLAP and Offline data storage modes. It supports both SQL and MDX queries, have RESTful API capabilities (also ODBC, and JDBC), and can be integrated/connect with Tableau (also Redash, Superset, Zeppelin, Qlik, and Excel).

It supports Real Time processing, partitioning, usage based optimizations, load balancing and clustering. It supports LDAP, SAML, Kerboros authentication.

#### Mondrian OLAP Server
Only supports ROLAP data storage modes. It supports MDX queries but not SQL, and have REST API capabilities. Does not natively connect with Tableau, but queries can be performed via Java APIs. It supports Real Time processing, and partitioning.