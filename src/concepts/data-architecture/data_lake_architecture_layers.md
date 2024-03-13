# Data Lake Layers

```admonish warning title="Page under construction"
:construction:
```

Data Lake layering was introduced to maximize the value and usability of the data stored within a Data Lake and address challenges related to data quality, governance, and accessibility.
These layers serve different purposes in the data management lifecycle and help organize data logically and efficiently, facilitating processing, analysis, and consumption.

The layered architecture, inspired by software engineering and systems design principles, has proven to be highly practical and efficient.
Abstraction layers separate concerns, enhance maintainability and improve scalability.
In the context of Data Lakes, layers such as Ingestion, Processing, and Insights allow for the separation of raw data management, data transformation and enrichment, and data access and visualization, respectively.
This approach not only simplifies the architecture but also ensures better governance, more efficient data processing, and easier access for end-users to derive insights.

<figure>
    <img src="../../assets/concepts/data-architecture/data_lake_architecture_layers_v1.svg" alt="Data Lake Architecture Layers" style="width:100%">
    <figcaption>Data Lake Architecture Layers.</figcaption>
</figure>

The layered data lake model approach is structured as:

* **Ingestion Layer**
* **Distillation Layer**
* **Processing Layer**
* **Insights Layer**
* **Unified Operations Layer**

The **Raw Data** entering the Data Lake consists of streaming and batch data from many sources, including Operational Systems and third-party data. Representing the data leaving the Data Lake, the **Business Systems** consists of databases, the Data Warehouse, dashboards, reports, and external data connections.

The Ingestion, Distillation, and Processing layers constitute the medallion architecture, a data design pattern that organizes data in a Data Lake. It consists of three layers designed to improve the quality and structure of data as it flows through each layer. This design pattern, also called "multi-hop" architecture, is used to process data in multiple sequential stages. This architecture aims to incrementally and progressively improve the structure and quality of data as it flows through each layer of the architecture.

## Ingestion Layer (Bronze or Raw)

The Bronze layer, serving as the essential entry point for all data entering the Data Lake, is designed to handle a diverse array of raw data, including logs, streams, files, database dumps, and data from third-party sources, in its unaltered, raw form.
This layer is engineered for high scalability, supporting both real-time streaming and batch ingestion processes to ensure that data is captured and stored efficiently and reliably.
The primary aim is to preserve the data's original state, with added metadata for improved traceability and manageability, facilitating reprocessing or analysis in its true form as necessary.

## Distillation Layer (Silver or Refined)

In the transition from the Ingestion to the Silver layer, also known as the Refined layer, raw data undergoes essential transformations to structure and organize it into a format more conducive to analysis.
This refining stage is crucial for cleansing, deduplicating, conforming, and enriching the data, ensuring consistency and reliability across the enterprise.
The modifications at this level are intentionally minimal yet precise, designed to prepare the data for more advanced analytics without incorporating complex business logic or extensive transformations reserved for the subsequent Processing (Gold) Layer.
This approach maintains a balance between making the data analytically accessible while preserving the granularity necessary for detailed examination.

## Processing Layer (Gold or Cured)

In the Gold Layer, also recognized as the Curated or Business layer, data undergoes its final transformations to emerge as fully prepared, enriched datasets tailored for specific business use cases and analytical endeavors.
This layer is distinguished by its highly curated, performance-optimized datasets readily accessible for BI reporting, advanced analytics, and machine learning applications.
Data models here are meticulously designed for consumption, often embodying business domains in denormalized structures, such as star schemas or subject-oriented data marts. They are enriched with dimensional models, aggregates, and KPIs to directly address the needs of business users and decision-makers.
The Gold layer ensures that data is not only reliable and understandable but also structured in a way that makes it immediately applicable to solving business challenges.

## Insights Layer

The Insights Layer is the interface for user interaction with the Data Lake.
It transforms data into actionable insights through dashboards, reports, and visual analytics.
It brings data to life, empowering users with the information needed for informed decision-making and guiding strategic actions within the organization.

## Unified Operations Layer

The backbone of any robust Data Lake architecture is its operations layer.
It integrates data governance, compliance, security, and performance optimization, ensuring the Data Lake's reliability and integrity as a critical organizational asset.

Together, these layers form a comprehensive framework for managing data in a Data Lake environment, supporting a wide range of analytical and operational use cases while ensuring data remains secure, high-quality, and accessible.

## The Medallion Architecture

The medallion or multi-hop architecture allows for a clear separation of concerns between data storage, processing, and consumption, providing several benefits:

* **Flexibility**: By separating data processing into distinct stages, the architecture provides flexibility in applying different transformations and data quality rules at each stage, allowing for iterative improvements and optimizations.
* **Scalability**: Each layer can scale independently based on the processing and storage needs, accommodating varying data volumes and complexity of transformations.
* **Governance and Quality Control**: With clear demarcations between raw, refined, and curated data, appropriate governance policies, data quality checks, and security measures can be applied more easily at each stage, improving the overall reliability and trustworthiness of the data.
* **Accessibility**: By the time data reaches the Gold layer, it's in a form that's readily accessible and usable by business analysts, data scientists, and decision-makers, speeding up the time-to-insight.

Overall, the medallion or multi-hop architecture is a comprehensive approach to managing data in a Data Lake, ensuring that data flows smoothly from ingestion to consumption while maintaining quality, governance, and accessibility.

## Use Case

```admonish todo
Guide Opetence Inc. to implement a layered data alake architecture.
```
