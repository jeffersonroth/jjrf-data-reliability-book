# Opetence Inc

```admonish warning title="Page under construction"
:construction:
```

Opetence Inc. presents a classic case of ambition clashing with reality, particularly in its approach to data management. The company has branded itself as data-driven, even hiring a data engineering team to lead the initiative. However, the reality is starkly different; the recommendations and insights offered by the data team are consistently overlooked, rendering their roles symbolic rather than substantive.

The CTO, while highly skilled in software development, holds outdated views on data engineering, failing to recognize its critical role in a modern tech company. This disconnect is further exacerbated by the company's rigid approach to technology, where a one-size-fits-all mentality prevails, notably in their insistence on using a Postgres database for purposes outside its capabilities, such as serving as a Data Warehouse. As we'll see in many use cases, databases, such as Postgres, are extensive in modern data infrastructure but not as a data warehouse solution.

The company's approach to data infrastructure is equally perplexing. Traditional roles and systems are repurposed in unconventional ways. Common DBA tasks, such as managing permissions, are handled by JavaScript services, and the "data warehouse" is essentially a basic Postgres database backed by unstructured S3 buckets serving as the "data lake." They also use JavaScript services to handle data warehouse schemas and tables with an ORM, treating it as if it were a database for a microservice. This unconventional setup has led to the creation of data marts and products that don't fully meet the needs of the data engineering or analytics teams, complicating the data environment further.

Before creating the data team, the company's strategy involved gathering a diverse range of data, such as real-time data, third-party data, and analytics data, into a single database. This resulted in a high level of security and architectural risks, likely to leave professionals in disbelief. External partners were allowed to store their data in the same database, containing raw operational data that included Personally Identifiable Information (PII) and other highly sensitive data. Any leakage could have led to the company's closure, hefty fines, and possible legal charges.

Despite its best intentions, Opetence Inc. ends up showing what not to do, highlighting the gap between wanting to be innovative and actually achieving it.

Through various use cases, we'll explore scenarios in which the data team tries to fix these messes and others in which the company comes up with even stranger ideas. We'll examine the proposals, their likely outcomes, and better alternatives while pointing out the risks and offering guidance to avoid replicating Opetence Inc.'s missteps.

## Use Cases

```admonish summary title="I - Foundations of Data Reliability Engineering"
Some use cases developed in the first section of the book:

* **Foundations Architecture**:
    * **[Two-Tier Architecture](../../concepts/data-architecture/two_tier_architecture.md#use-case)**
    * **[Three-Tier Architecture](../../concepts/data-architecture/three_tier_architecture.md#use-case)**
    * **[N-Tier Architecture](../../concepts/data-architecture/n_tier_architecture.md#use-case)**
* **Modern Architectural Paradigms**:
    * **[Microservices Architecture](../../concepts/data-architecture/microservices_architecture.md#use-case)**
    * **[Service-Oriented Architecture (SOA)](../../concepts/data-architecture/soa.md#use-case)**
    * **[Cloud-Native Data Architectures](../../concepts/data-architecture/cloud_native_data_architectures.md#use-case)**
    * **[Data Mesh](../../concepts/data-architecture/data_mesh.md#use-case)**
* **Data Storage and Processing**:
    * **[Data Lake Architecture: Layers](../../concepts/data-architecture/data_lake_architecture_layers.md#use-case)**
    * **[Data Lake Architecture: Zones](../../concepts/data-architecture/data_lake_architecture_zones.md#use-case)**
```
