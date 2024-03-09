# Data Modelling

## Kimball/Bottom-Up
>
> The design of the Data Marts comes from the business requirements.

The primary data sources are then evaluated, and ETL tools are used to fetch data from several sources and load it into a staging area of the relational database server.
Once data is uploaded in the data warehouse staging area, the next phase includes loading data into a dimensional data warehouse model that is denormalized by nature.
This model partitions data into the fact and dimension tables.
Kimball dimensional modeling allows users to construct several star schemas to fulfill various reporting needs.

<div style="position: relative; width: 100%; height: 0; padding-top: 50.0000%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbfV1mwLM&#x2F;view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>
<a href="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbfV1mwLM&#x2F;view?utm_content=DAFbfV1mwLM&amp;utm_campaign=designshare&amp;utm_medium=embeds&amp;utm_source=link" target="_blank" rel="noopener"><p style="text-align: center;">Kimball Approach to Data Warehouse Lifecycle.</p></a>

### Advantages

**Fast to construct (quick initial phase)**: it is fast to construct as no normalization is involved, which means swift execution of the initial phase of the data warehousing design process.

**Simplified queries**: in a star schema, most data operators can easily comprehend it because of its denormalized structure, which simplifies querying and analysis.

**Simplified business management**: the data warehouse system footprint is trivial because it focuses on individual business areas and processes rather than the whole company. So, it takes less space in the database, simplifying system management.

**Fast data retrieval**: as data is segregated into fact tables and dimensions.

**Smaller teams**: a smaller team of designers and planners is sufficient for data warehouse management because data source systems are stable, and the data warehouse is process-oriented. Also, query optimization is straightforward, predictable, and controllable.

**Deeper insights**: it allows business intelligence tools to deeper across several star schemas and generates reliable insights.

### Disadvantages

**No Single Source of Truth**: Data isn’t entirely integrated before reporting, so the idea of a single source of truth is lost.

**Too prone to data irregularities**: this is because, in the denormalization technique, redundant data is added to database tables.

**Too difficult and expensive to add new columns**: performance issues may occur due to the addition of columns in the fact table, as these tables are quite in-depth. The addition of new columns can expand the fact table dimensions, affecting its performance.

**Can't respond (well) to business changes**: it is too difficult to alter the models.

**Not BI-friendly**: as it is business process-oriented, instead of focusing on the company as a whole, it cannot handle all the BI reporting requirements.

**Inconsistent dimensional view**: this model is not as strong as the top-down approach as the dimensional view of data marts is not as consistent as it is in the Inmon approach.

In brief, the Kimball approach has a **low** start-up cost**, is **faster to deliver** the first phase of the data warehouse design, and is faster to release to production (first version), but is suitable for **Tactical** business decision support requirements (versus Strategic), and **addresses individual business requirements** (vs Enterprise-wide). Another important topic that derives from this methodology approach is the **Data Warehouse Bus Architecture**.

## Inmon/Top-Down
>
> Subject-oriented, nonvolatile, integrated, time-variant collection of data in support of management’s decisions.

On the other hand, Bill Inmon, the father of data warehousing, came up with the concept of developing a data warehouse that identifies the main subject areas and entities the enterprise works with, such as customers, products, vendors, etc. Inmon’s definition of a data warehouse is that it is a “subject-oriented, nonvolatile, integrated, time-variant collection of data in support of management’s decisions”.

The model then creates a **thorough, logical model for every primary entity** (Business Entities). For instance, a logical model is constructed for products with all the attributes associated with that entity. This logical model could include many entities, including all the details, aspects, relationships, dependencies, and affiliations.

The Inmon design approach uses the **normalized form** for building **entity structure**, avoiding data redundancy as much as possible. This results in clearly identifying business requirements and **preventing any data update irregularities**. Moreover, the advantage of this top-down approach in database design is that it is **robust to business changes** and contains a dimensional perspective of data across data mart.

Next, the physical model is constructed, which follows the normalized structure. This Inmon model creates a **Single Source of Truth** for the whole business to consume. Data loading becomes less complex due to the normalized structure of the model. However, using this arrangement for querying is challenging as it includes numerous tables and links.

This Inmon data warehouse methodology proposes constructing data marts separately for each division, such as finance, marketing sales, etc. All the data entering the data warehouse is integrated. The data warehouse acts as a single data source for various data marts to ensure integrity and consistency across the enterprise.

### Inmon Advantages

**Single Source of Truth**: the data warehouse acts as a unified source of truth for the entire business, where all data is integrated.

**Very low data redundancy**: there’s less possibility of data update irregularities, making the data warehouse ETL processes more straightforward and less susceptible to failure.

**Great flexibility**: it’s easier to update the data warehouse in case there’s any change in the business requirements or source data.

**BI-friendly**: It can handle diverse company-wide reporting requirements.

### Inmon Disadvantages

**Increasing complexity**: it increases as multiple tables are added to the data model with time.

**Skilled Human Resources**: resources skilled in data warehouse data modeling are required, which can be expensive and challenging to find.

**Slow setup**: the preliminary setup and delivery are time-consuming.

**Expert management**: this approach requires experts to manage a data warehouse effectively.

In brief, the Inmon has a **high** start-up cost**, requires **more time to be in production** and meet business needs (very large projects with a very broad scope), and **requires a bigger team of specialists**, but is more **suitable for systems and** business changes**, better **integrates with the whole organization**, favors **Strategic business decision support requirements** (vs Tactical), and **facilitates Business Intelligence development**.

## Hybrid
>
> In a hybrid model, the data warehouse is built using the Inmon model, and on top of the integrated data warehouse, the business process-oriented data marts are built using the star schema for reporting.

The hybrid approach provides a **Single Source of Truth** for the data marts, creating highly flexible solutions from a BI point of view.

Based on the [Hub and Spoke Architecture](https://www.researchgate.net/publication/261302233_The_Customer-Centric_Data_Warehouse_An_Architectural_Approach_to_Meet_the_Challenges_of_Customer_Orientation), the hybrid design methodology can also make use of [Operational Data Stores](https://en.wikipedia.org/wiki/Operational_data_store) (ODS), integrating and cleaning data from multiple data sources. The information is then parsed into the actual Data Warehouse.

Hybrid methods will normally keep the data in the 3rd normal form, reducing redundancy. Although a normal relational database is not efficient for BI reports. Data marts for specific reports can then be built on top of the data warehouse solution.

When the data is denormalized, all the data available is pulled (as advocated by Inmon) while using a denormalized design (as advocated by Kimball). One example is the [Carry Forward](https://web.archive.org/web/20230921221322/https://resilientbiz.com/the-resilient-hybrid-methodology-data-warehouse/) method.

Another hybrid methodology is the Data Vault, discussed below.

<div style="position: relative; width: 100%; height: 0; padding-top: 50.0000%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbfihtfys&#x2F;view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>
<a href="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbfihtfys&#x2F;view?utm_content=DAFbfihtfys&amp;utm_campaign=designshare&amp;utm_medium=embeds&amp;utm_source=link" target="_blank" rel="noopener"><p style="text-align: center;">Example of a Hybrid Methodology approach.</p></a>

## Vault

The **Vault Data Modelling** is a hybrid design, consisting of the best-of-breed practices from both **3rd normal form** and **star schema**.

It is not a true 3rd normal form and breaks some of the rules that 3NF dictates. It is a top-down architecture with a bottom-up design, geared to be strictly a data warehouse. It is not geared to be end-user accessible, which when built, still requires the user of a data mart or star-schema-based release for business purposes.

Data Vault data modeling breaks data into a small number of standard components – the most common of which are **Hubs, **Links**, and **Satellites**.

**Hubs** are entities of interest to the business. They contain just a distinct list of business keys and metadata about when each key was first loaded and from where.

**Links** connect Hubs and may record a transaction, composition, or other type of relationship between hubs. They contain details of the hubs involved (as foreign keys) and metadata about when the link was first loaded and from where.

**Satellites** connect to Hubs or Links. They are Point in Time: so we can ask and answer the question, "What did we know when?". Satellites contain data about their parent Hub or Link and metadata about when the data was loaded, from where, and a business effectivity date.

The data model of the data warehouse is constructed using these components. These are:

**Standard**: each component is always constructed the same way.

**Simple**: easy to understand, and with a little practice, easy to apply to model your system.

**Connected**: hubs only connect to links and satellites, links only connect to hubs and satellites, and satellites only connect to hubs or links.

Data Vault has staging, vault, and mart layers. Star schemas live in the mart layer, each star schema exposes a subset of the vault for a particular group of users.  Typically, hubs and their satellites form dimensions, and links and their satellites form facts.

A Data Vault complements the Data Lake and is a solution for organizations that need to integrate and add structure to the data held in the Data Lake.

<div style="position: relative; width: 100%; height: 0; padding-top: 50.0000%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbf7fKp9s&#x2F;view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>
<a href="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAFbf7fKp9s&#x2F;view?utm_content=DAFbf7fKp9s&amp;utm_campaign=designshare&amp;utm_medium=embeds&amp;utm_source=link" target="_blank" rel="noopener"><p style="text-align: center;">Example of Data Vault 2.0 Modelling Methodology approach.</p></a>

## Bus Architecture
>
> A bus architecture is composed of a set of tightly integrated data marts that get their power from conformed dimensions and fact tables. A conformed dimension is defined and implemented one time so that it means the same thing everywhere it's used.

A dimension table is the "lookup" table of a dimensional model.
It contains textual data that decodes an identifier in associated fact tables.
A conformed dimension is defined and implemented one time and used throughout the multiple-star schemas that make up the enterprise data mart.
Dimensions define the who, what, where, when, why, and how of a situation, and are laid out for the benefit of business users.

> To conform to a dimension, every stakeholder must agree on a common definition for the dimension, so that the dimension means the same thing no matter where it’s used.

```admonish todo
* [data warehouse bus architecture](https://www.itprotoday.com/sql-server/data-warehouse-bus-architecture)
* Inflow, Upflow, Downflow, Outflow, and Meta flow
```
