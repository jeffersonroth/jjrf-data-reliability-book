<title>Opetence Inc.</title>
<meta name="description" content="Opetence Inc.'s use cases">
<meta name="author" content="Jefferson Roth">
<meta name="keywords" content="Opetence Inc., use cases, use case">

# Opetence Inc

```admonish warning title="Page under construction"
:construction:
```

```admonish tip title="Opetence Inc."
Opetence Inc. stands for Incompetence.
```

Opetence Inc. presents a classic case of ambition clashing with reality, notably in its approach to data management. The company has branded itself as data-driven, even hiring a data engineering team to lead the initiative. However, the reality is starkly different; the recommendations and insights offered by the data team are consistently overlooked, rendering their roles symbolic rather than substantive.

The CTO, while highly skilled in software development, holds incredibly inaccurate views on data engineering, especially regarding data architecture. This disconnect is further exacerbated by the weird attempt to reduce all solutions to a piece of JavaScript service and a Postgres database. As we'll see in many use cases, databases, such as Postgres, are extensive in modern data infrastructure but not as a data warehouse solution. JavaScript is rarely the language to go to when writing data-related services.

The company's approach to data architecture is perplexing. Traditional roles and systems are repurposed in unconventional ways. Common DBA tasks, such as managing permissions, are handled by JavaScript services, and the "data warehouse" is essentially a basic Postgres database backed by unstructured S3 buckets serving as the "data lake." JavaScript services also handle the data warehouse database migrations using an Object-Relational Mapping (ORM) tool. This unconventional setup has led to the creation of data marts and products that don't fully meet the needs of the data engineering or analytics teams or the business.

Before creating the data team, the company's strategy involved gathering a diverse range of data, such as real-time data, third-party data, and analytics data, into a single database. This resulted in a high level of security and architectural risks, likely to leave professionals in disbelief. External partners were allowed to store their data in the same database, containing raw operational data that included Personally Identifiable Information (PII) and other highly sensitive data. Any leakage could have led to the company's closure, hefty fines, and possible legal charges.

Despite its best intentions, Opetence Inc. ends up showing what not to do. Through various use cases, we'll explore scenarios in which the data team tries to fix these messes and others in which the company comes up with even stranger ideas. We'll examine the proposals, their likely outcomes, and better alternatives while pointing out the risks and offering guidance to avoid replicating Opetence Inc.'s missteps.

## Use Cases

```admonish summary title="I - Foundations of Data Reliability Engineering"
Some use cases developed in the first section of the book:

* **Foundations Architecture**:
    * **[Two-Tier Architecture](../../concepts/data-architecture/foundational-architectures/two_tier_architecture.md#use-case)**
    * **[Three-Tier Architecture](../../concepts/data-architecture/foundational-architectures/three_tier_architecture.md#use-case)**
    * **[N-Tier Architecture](../../concepts/data-architecture/foundational-architectures/n_tier_architecture.md#use-case)**
* **Modern Architectural Paradigms**:
    * **[Microservices Architecture](../../concepts/data-architecture/modern-architectural-paradigms/microservices_architecture.md#use-case)**
    * **[Service-Oriented Architecture (SOA)](../../concepts/data-architecture/modern-architectural-paradigms/service_oriented_architecture.md#use-case)**
    * **[Cloud-Native Data Architectures](../../concepts/data-architecture/modern-architectural-paradigms/cloud_native_data_architectures.md#use-case)**
    * **[Data Mesh](../../concepts/data-architecture/modern-architectural-paradigms/data_mesh.md#use-case)**
* **Data Storage and Processing**:
    * **[Data Lake Architecture: Layers](../../concepts/data-architecture/data-lakes/layers.md#use-case)**
    * **[Data Lake Architecture: Zones](../../concepts/data-architecture/data-lakes/zones.md#use-case)**
```
