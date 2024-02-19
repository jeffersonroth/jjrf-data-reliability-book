# Master Data
Master Data refers to the core data within an organization that is essential for its operations and decision-making processes. This data is non-transactional and represents the business's key entities such as customers, products, employees, suppliers, and more. Master data is characterized by its stability and consistency across the organization and is used across various systems, applications, and processes.

Master data is critical because it provides a common point of reference for the organization, ensuring that everyone is working with the same information. Consistency in master data across different business units and systems reduces ambiguity and errors, leading to more accurate analytics, reporting, and business intelligence.

## Master Data Management (MDM)
Master Data Management (MDM) is a comprehensive method of defining, managing, and controlling master data entities, processes, policies, and governance to ensure that master data is consistent, accurate, and available throughout the organization. MDM involves the integration, cleansing, enrichment, and maintenance of master data across various systems and platforms within the enterprise.

Key Components of MDM:
* **Data Governance**: Establishing policies, standards, and procedures for managing master data, including data ownership, data quality standards, and data security.
* **Data Stewardship**: Assigning responsibility for managing, maintaining, and ensuring the quality of master data to specific roles within the organization.
* **Data Integration**: Aggregating and consolidating master data from disparate sources to create a single source of truth.
* **Data Quality Management**: Implementing processes and tools to ensure the accuracy, completeness, consistency, and timeliness of master data.
* **Data Enrichment**: Enhancing master data with additional attributes or corrections to increase its value to the organization.

## Resolving Entities
Resolving entities in the context of Master Data and Master Data Management (MDM) is crucial for ensuring consistency, accuracy, and a single source of truth for core business entities such as customers, products, employees, suppliers, etc. Entity resolution involves identifying, linking, and merging records that refer to the same real-world entities across different systems and datasets.

Here's how entity resolution can be approached:
1. **Identification**:
The first step involves identifying potential matches among entities across different systems or datasets. This can be challenging due to variations in data entry, abbreviations, misspellings, or incomplete records. Techniques Used: Pattern matching, fuzzy matching, and using algorithms that can handle variations and typos.

2. **Deduplication**:
Deduplication involves removing duplicate records of the same entity within a single dataset or system. This step is crucial to prevent redundancy and ensure each entity is represented once. Techniques Used: Hashing, similarity scoring, and machine learning models to recognize duplicates even when data is not identical.

3. **Linking**:
Linking is the process of associating related records across different datasets or systems that refer to the same real-world entity. This step creates a unified view of each entity. Techniques Used: Record linkage techniques, probabilistic matching, and reference matching where a common identifier or set of identifiers is used to link records.

4. **Merging**:
Merging involves consolidating linked records into a single, comprehensive record that provides a complete view of the entity. Decisions must be made about which data elements to retain, merge, or discard. Techniques Used: Survivorship rules that define which attributes to keep (e.g., most recent, most complete, source-specific priorities).

5. **Data Enrichment**:
After resolving and merging entities, data enrichment can be applied to enhance the master records with additional information from external sources, improving the depth and value of the master data. Techniques Used: Integrating third-party data, leveraging public datasets, and using APIs to fetch additional information.

6. **Continuous Monitoring and Updating**:
Entity resolution is not a one-time task. Continuous monitoring and updating are necessary to accommodate new data, changes to existing entities, and evolving relationships among entities. Techniques Used: Implementing feedback loops, periodic reviews, and automated monitoring systems to identify and resolve new or changed entities.

## Master Data Architecture
Master Data Architecture refers to the framework and models used to manage and organize an organization's master data, which typically includes core business entities like customers, products, employees, and suppliers. The architecture aims to ensure that master data is consistent, accurate, and available across the enterprise.

Key Components:
* **Master Data Hub**: A central repository where master data is consolidated, managed, and maintained. It ensures a single source of truth for master data entities across the organization.
* **Data Integration Layer**: Mechanisms for extracting, transforming, and loading (ETL) data from various source systems into the master data hub. This layer handles data cleansing, deduplication, and standardization.
* **Data Governance Framework**: Policies, standards, and procedures that govern how master data is collected, maintained, and utilized, ensuring data quality and compliance.
* **Data Quality Services**: Tools and processes for continuously monitoring and improving the quality of master data, including validation, enrichment, and error correction.
* **Application Interfaces**: APIs and services that enable other systems and applications within the organization to access and interact with the master data.

### 4 Variants of Master Data Architecture
Jochen and Weisbecker (2014) proposed four variants of master data architecture to address different organizational needs and data management strategies. Each variant offers a unique approach to handling master data, considering factors like centralization, data governance, and system integration. Here's a summary of each:

1. **Centralized Master Data Management**
* **Description**: This architecture involves a single, centralized repository where all master data is stored and managed. It serves as the authoritative source for all master data across the organization.
* **Advantages**: Ensures consistency and uniformity of master data across the enterprise, simplifies governance, and reduces data redundancy.
* **Challenges**: Requires significant investment in a centralized system, can lead to bottlenecks, and may be less responsive to local or departmental needs.

2. **Decentralized Master Data Management**
* **Description**: In this variant, master data is managed locally within different departments or business units without a central repository. Each unit maintains its own master data.
* **Advantages**: Offers flexibility and allows departments to manage data according to their specific needs and processes, enabling quicker responses to local requirements.
* **Challenges**: Increases the risk of data inconsistencies across the organization, complicates data integration efforts, and makes enterprise-wide data governance more challenging.

3. **Registry Model**
* **Description**: The registry model uses a centralized registry that stores references (links or keys) to master data but not the master data itself. The actual data remains in local systems.
* **Advantages**: Provides a unified view of where master data is located across the organization without centralizing the data itself, facilitating data integration and consistency checks.
* **Challenges**: Does not eliminate data redundancies and may require complex synchronization mechanisms to ensure data consistency across systems.

4. **Hub and Spoke Model**
* **Description**: This architecture features a central hub where master data is consolidated, synchronized, and distributed to various "spoke" systems throughout the organization.
* **Advantages**: Balances centralization and decentralization by allowing data to be managed centrally while also supporting local system requirements. It facilitates data sharing and consistency.
* **Challenges**: Can be complex to implement and maintain, requiring robust integration and data synchronization capabilities between the hub and spoke systems.

Each of these master data architecture variants offers distinct benefits and poses unique challenges, making them suitable for different organizational contexts and data management objectives. The choice among these variants depends on factors such as the organization's size, complexity, data governance maturity, and specific business needs.

### Information Architecture Principles
Information Architecture (IA) principles guide the design and organization of information to make it accessible and usable. In the context of master data management, these principles help ensure that master data is effectively organized and can support business needs.

Key Principles:
* **Clarity and Understandability**: Information should be presented in a clear and understandable manner, with consistent terminology and categorization that aligns with business operations.
* **Accessibility**: Master data should be easily accessible to authorized users and systems, with appropriate interfaces and query capabilities.
* **Scalability**: The architecture should be able to accommodate growth in data volume, variety, and usage, ensuring that it can support future business requirements.
* **Flexibility**: The architecture should be flexible enough to adapt to changes in business processes, data models, and technology landscapes.
* **Security and Privacy**: Ensuring that master data is protected from unauthorized access and breaches, and that it complies with data protection regulations.
* **Integration**: The architecture should facilitate the integration of master data with other business processes and systems, ensuring seamless data flow and interoperability.
* **Data Quality Focus**: A continual emphasis on maintaining and improving the quality of master data through validation, cleansing, and governance practices.

## Master Data Management Maturity Models
Master Data Management (MDM) maturity models are frameworks that help organizations assess their current state of MDM practices and identify areas for improvement to achieve more effective management of their master data.

MDM maturity models typically outline a series of stages or levels through which an organization progresses as it improves its master data management capabilities. These models often start with an initial stage characterized by ad-hoc and uncoordinated master data efforts and progress through more sophisticated stages involving standardized processes, integrated systems, and eventually, optimized and business-aligned MDM practices.

The levels in an MDM maturity model might include:
* **Initial/Ad-Hoc**: Master data is managed in an uncoordinated way, often within siloed departments.
* **Repeatable**: Some processes are defined, and there might be local consistency within departments, but efforts are not yet standardized across the organization.
* **Defined**: Organization-wide standards and policies for MDM are established, leading to greater consistency and control.
* **Managed**: MDM processes are monitored and measured, and data quality is actively managed across the enterprise.
* **Optimized**: Continuous improvement processes are in place, and MDM is fully aligned with business strategy, driving value and innovation.

### Loshin's MDM Maturity Model
David Loshin's MDM maturity model is particularly insightful because it not only outlines stages of maturity but also focuses on the alignment of MDM processes with business objectives, emphasizing the strategic role of master data in driving business success.

Loshin's model includes the following key stages:
* **Awareness**: The organization recognizes the importance of master data but lacks formal management practices.
* **Concept/Definition**: Initial efforts to define master data and understand its impact on business processes are undertaken.
* **Construction and Integration**: Systems and processes are developed for managing master data, with a focus on integrating MDM into existing IT infrastructure.
* **Operationalization**: MDM processes are put into operation, and the organization starts to see benefits in terms of data consistency and quality.
* **Governance**: Formal governance structures are established to ensure ongoing data quality, compliance, and alignment with business objectives.
* **Optimization**: The organization continuously improves its MDM practices, leveraging master data as a strategic asset to drive business innovation and value.

Loshin emphasizes the importance of not just the technical aspects of MDM but also the governance, organizational, and strategic components. The model encourages organizations to progress from merely managing data to leveraging it as a key factor in strategic decision-making and business processes optimization.

## ISO 8000
The ISO 8000 standard series is focused on data quality and master data management, providing guidelines and best practices to ensure that data is accurate, complete, and fit for use in various business contexts. This series covers a wide range of topics related to data quality, from terminology and principles to data provenance and master data exchange.

Let's explore some of the key parts of the ISO 8000 series relevant to Master Data and Data Quality:

### ISO 8000-100: Data Quality Management Principles
> This part of the ISO 8000 series outlines the foundational principles for managing data quality, establishing a framework for assessing, improving, and maintaining the quality of data within an organization.

### ISO 8000-102: Data Quality Provenance
> Focuses on the provenance of data, detailing how to document the source of data and its lineage. This is crucial for understanding the origins of data, assessing its reliability, and ensuring traceability.

### ISO 8000-110: Syntax and Semantic Encoding
> Addresses the importance of using standardized syntax and semantics to ensure that data is consistently understood and interpreted across different systems and stakeholders.

### ISO 8000-115: Master Data: Exchange of characteristic data
> Provides guidelines for the exchange of master data, particularly focusing on the characteristics of products and services. It emphasizes the standardization of data formats to facilitate accurate and efficient data exchange.

### ISO 8000-116: Data Quality: Information and Data Quality Vocabulary
> Defines a set of terms and definitions related to data and information quality, helping organizations to establish a common understanding of key concepts in data quality management.

### ISO 8000-120: Master Data Quality: Prerequisites for data quality
> Discusses the prerequisites for achieving high-quality master data, including the establishment of data governance, data quality metrics, and continuous monitoring processes.

### ISO 8000-130: Data Quality Management: Process reference model
> Introduces a process reference model for data quality management, outlining the key processes involved in establishing, implementing, maintaining, and improving data quality within an organization.

### ISO 8000-140: Data Quality Management: Assessment and measurement
> Focuses on the assessment and measurement of data quality, providing methodologies for evaluating data quality against defined criteria and metrics.

### ISO 8000-150: Master Data Quality: Master data quality assessment framework
> Offers a comprehensive framework for assessing the quality of master data, including methodologies for evaluating data against specific quality dimensions such as accuracy, completeness, and consistency.

## ISO/IEC 22745
The ISO/IEC 22745 standard, titled "Industrial automation systems and integration — Open technical dictionaries and their application to master data," is a series of international standards developed to facilitate the exchange and understanding of product data. This standard is particularly significant in the context of industrial automation and integration, providing a framework for creating, managing, and deploying open technical dictionaries. These dictionaries ensure that product data is consistent, interoperable, and can be seamlessly exchanged between different systems and organizations, enhancing data quality and reliability across the supply chain.

ISO/IEC 22745 is crucial for organizations involved in manufacturing, supply chain management, and industrial automation because it standardizes the way product and service data is described, categorized, and exchanged. This standardization supports more efficient procurement processes, reduces the risk of misinterpretation of product data, and enhances interoperability between different IT systems and platforms. By implementing ISO/IEC 22745, organizations can improve the accuracy and reliability of their master data, leading to better decision-making and operational efficiencies.

### Part 1: Overview and Fundamental Principles
> Provides a general introduction to the standard, outlining its scope, objectives, and fundamental principles. It sets the foundation for the development and use of open technical dictionaries.

### Part 2: Vocabulary
> Establishes the terms and definitions used throughout the ISO/IEC 22745 series, ensuring a common understanding of key concepts related to open technical dictionaries and master data exchange.

### Part 10: Exchange of characteristic data: Syntax and semantic encoding rules
> Specifies the syntax and semantic encoding rules for exchanging characteristic data, ensuring that data exchanged between systems maintains its meaning and integrity.

### Part 11: Methodology for the development and validation of open technical dictionaries
> Details the methodology for developing and validating open technical dictionaries, including processes for creating, approving, and maintaining dictionary entries.

### Part 13: Identification and referencing of requirements of product data
> Focuses on the identification and referencing of product data requirements, providing guidelines for documenting and referencing product specifications and standards.

### Part 14: Guidelines for the formulation of requests for master data
>Provides guidelines for formulating requests for master data, ensuring that data requests are clear, structured, and capable of being fulfilled accurately.

### Part 20: Presentation of characteristic data
> Addresses the presentation of characteristic data, outlining how data should be formatted and displayed to ensure clarity and usability.

### Part 30: Registration and publication of open technical dictionaries
> Covers the registration and publication processes for open technical dictionaries, ensuring that dictionaries are accessible, authoritative, and maintained over time.

### Part 35: Identification and referencing of terminology
> Discusses the identification and referencing of terminology within open technical dictionaries, ensuring consistent use of terms and definitions.

### Part 40: Master data repository
> Describes the requirements and structure of a master data repository, a centralized system for storing and managing master data in accordance with the principles of ISO/IEC 22745.

## MDM Tools Implementation Considerations
There are several MDM tools available, including SAP Master Data Governance (MDG), Informatica MDM, IBM InfoSphere MDM, Microsoft SQL Server Master Data Services (MDS), Oracle MDM, Talend MDM, ECCMA, PILOG, TIBCO MDM, Ataccama MDC, VisionWare Multivue MDM, and many others.

When implementing these master data tools, companies typically go through a series of steps including:
* **Assessment**: Evaluating the current state of master data, identifying key data domains, and understanding the data lifecycle.
* **Strategy Development**: Defining objectives, governance structures, and key performance indicators (KPIs) for the MDM initiative.
* **Tool Selection**: Choosing an MDM tool that aligns with the company's IT infrastructure, data domains, and business objectives.
* **Integration**: Integrating the MDM tool with existing systems and data sources to ensure seamless data flow and synchronization.
* **Data Cleansing and Migration**: Cleaning existing data to remove duplicates and inconsistencies before migrating it into the MDM system.
* **Governance and Maintenance**: Establishing ongoing data governance practices to maintain data quality, including monitoring, auditing, and updating data as needed.

Master data tools are essential for organizations to maintain a "**single source of truth**" for their critical business entities, enabling more informed decision-making, improved customer experiences, and streamlined operations.

## Using a Commercial MDM Tool vs. Building an In-House MDM Service
Deciding between using a commercial Master Data Management (MDM) tool and building an in-house MDM service involves weighing various factors, including cost, scalability, customization, and maintenance. Each approach has its unique set of challenges, advantages, and disadvantages.

### Using a Commercial MDM Tool
**Pros**:
* **Speed of Deployment**: Commercial MDM tools offer out-of-the-box solutions that can be quickly deployed, allowing organizations to benefit from improved data management in a shorter timeframe.
* **Proven Reliability**: These tools are developed by experienced vendors, tested across diverse industries and scenarios, ensuring a level of reliability and robustness.
* **Support and Updates**: Vendors provide ongoing support, regular updates, and enhancements, which helps in keeping the MDM system current with the latest data management trends and technologies.
* **Built-in Best Practices**: Commercial tools often incorporate industry best practices in data governance, data quality, and data integration, reducing the learning curve and implementation risk.
* **Scalability**: Most commercial MDM solutions are designed to scale with the growth of the business, accommodating increasing data volumes and complexity without significant rework.

**Cons**:
* **Cost**: Licensing fees for commercial MDM tools can be substantial, especially for large enterprises or when scaling up, and there might be additional costs for support and customization.
* **Limited Customization**: While these tools offer configuration options, there may be limitations to how much they can be tailored to meet unique business requirements.
* **Vendor Lock-in**: Relying on a vendor's tool can lead to dependency, making it challenging to switch solutions or integrate with non-supported platforms and data sources in the future.

**Challenges**:
* Navigating complex licensing structures and ensuring the tool fits within the budget constraints.
* Integrating the MDM tool with legacy systems and diverse data sources.

### Building an In-House MDM Service
**Pros**:
* **Customization**: Building an MDM service in-house allows for complete customization to the specific needs, processes, and data models of the organization.
* **Integration**: An in-house solution can be designed to integrate seamlessly with existing systems and data sources, providing a more cohesive data ecosystem.
* **Control**: Organizations maintain full control over the development, maintenance, and evolution of the MDM service, making it easier to adapt to changing business needs.

**Cons**:
* **Resource Intensive**: Developing an MDM service requires significant upfront investment in terms of time, skilled personnel, and infrastructure.
* **Maintenance and Support**: The organization is responsible for ongoing maintenance, updates, and support, which can divert resources from other critical IT functions or business initiatives.
* **Risk of Obsolescence**: Without continuous investment in keeping the MDM service up-to-date with the latest data management trends and technologies, there's a risk it could become obsolete.
* **Longer Time to Value**: Designing, developing, and deploying an in-house MDM solution can take considerably longer, delaying the realization of benefits.

**Challenges**:
* Ensuring the in-house team has the required expertise in data management best practices, technologies, and regulatory compliance.
* Balancing the ongoing resource requirements for development, maintenance, and upgrades of the MDM service.

When creating a Master Data Management (MDM) service, organizations need to consider various architectural options to best meet their business requirements, data governance policies, and technical landscape. These options range from centralized systems to more distributed approaches, each with its advantages and challenges. Here are some common MDM architecture options:

1. **Centralized MDM Architecture**
* **Description**: A single, central MDM system serves as the authoritative source for all master data across the organization. All applications and systems that require master data integrate with this central repository.
* **Pros**: Ensures consistency and a single version of the truth for master data; simplifies governance and data quality management.
* **Cons**: Can create bottlenecks; may be less responsive to local or department-specific needs; single point of failure risk.
* **Challenges**: Requires significant upfront investment and effort to integrate disparate systems and data sources.

2. **Decentralized MDM Architecture**
* **Description**: Master data is managed locally within different departments or business units, with no overarching central MDM system. Each unit maintains its own master data according to its specific needs.
* **Pros**: Offers flexibility; allows departments to manage data according to their unique requirements; can be quicker to implement within individual departments.
* **Cons**: Risk of data inconsistencies and duplication across the organization; challenges in achieving a unified view of data; more complex data integration efforts.
* **Challenges**: Coordinating data governance and ensuring data quality across decentralized systems can be complex.

3. **Registry MDM Architecture**
* **Description**: A centralized registry holds references (links or keys) to master data but not the master data itself. Actual data remains in source systems, and the registry provides a unified view.
* **Pros**: Reduces data redundancy; easier to implement than a fully centralized model; provides a unified view without moving data.
* **Cons**: Data quality and consistency must still be managed in each source system; requires robust integration and synchronization mechanisms.
* **Challenges**: Ensuring real-time synchronization and maintaining the accuracy of links or references in the registry.

4. **Hub and Spoke MDM Architecture**
* **Description**: Combines elements of centralized and decentralized architectures. A central hub manages core master data, which is then synchronized with "spoke" systems where additional, local master data management may occur.
* **Pros**: Balances central control with flexibility for local departments; facilitates data sharing and consistency.
* **Cons**: Complexity in managing and synchronizing data between the hub and spokes; potential for data conflicts between central and local systems.
* **Challenges**: Designing effective synchronization and conflict resolution mechanisms; managing the scalability of the system.

5. **Federated MDM Architecture**
* **Description: A federated approach integrates multiple MDM systems, each managing master data for specific domains (e.g., customers, products) or regions, without a single central system.
* **Pros**: Allows specialized management of different data domains; can accommodate different governance models; suitable for large, geographically dispersed organizations.
* **Cons**: Complex data integration and interoperability challenges; risk of inconsistencies between federated systems.
* **Challenges**: Ensuring seamless data integration and consistent governance across federated MDM systems.

6. **Multi-Domain MDM Architecture**
* **Description**: A single MDM system is designed to manage multiple master data domains (e.g., customers, products) within one platform, providing a unified approach to managing diverse data types.
* **Pros**: Simplifies the IT landscape; reduces integration complexity; offers a consistent approach to data governance and quality across domains.
* **Cons**: Requires a flexible and scalable MDM solution; may be challenging to meet the specific needs of each data domain within a single system.
* **Challenges**: Balancing the flexibility needed for different data domains with the desire for a unified MDM platform.

## MDM Ownership
Responsibility for Master Data Management (MDM) within an organization can vary significantly depending on the company's size, structure, and how data-driven its operations are. Regardless of company size, it's crucial for MDM responsibilities to involve collaboration between IT departments (who understand the technical aspects of data management and integration) and business units (who understand the data's practical use and business implications). This collaborative approach ensures that MDM efforts are aligned with business objectives and that master data is both technically sound and relevant to business needs.

### Small Companies
In smaller companies, MDM responsibilities might fall to a single individual or a small team. This could be the IT Manager, a Data Analyst, or even a Business Manager who has a good understanding of the company's data needs.

A startup with a lean team might have its CTO or a senior developer overseeing MDM as part of their broader responsibilities. They might focus on essential MDM tasks such as defining key data entities and ensuring data quality in critical systems like CRM and ERP.

### Medium-sized Companies
As companies grow, they often establish dedicated roles or departments for data management. This might include a Data Manager, MDM Specialist, or a small Data Governance team.

A mid-sized retail company might have an MDM Specialist within the IT department responsible for coordinating master data across various systems like inventory management, customer databases, and supplier information. This role might work closely with department heads to ensure data consistency and quality.

### Large Enterprises
In large enterprises, MDM is typically a significant function that involves multiple roles and departments. This can include a Chief Data Officer (CDO) at the strategic level, Data Stewards who oversee data quality and compliance in specific domains, and an MDM team that handles the day-to-day management of master data.

A multinational corporation, for example, might have a CDO responsible for the overall data strategy, including MDM. Under the CDO, there might be Data Stewards for different data domains (e.g., customer data, product data) and a dedicated MDM team that works on integrating, cleansing, and maintaining master data across global systems.

### Industry-specific Considerations
* **Healthcare**: In a hospital or healthcare provider, the responsibility for MDM might fall to a Health Information Manager or a dedicated team within the medical records department, ensuring patient data accuracy across systems.
* **Finance**: In a bank or financial services firm, MDM might be overseen by a Chief Information Officer (CIO) or a specific data governance committee that ensures compliance with financial regulations and data consistency across customer accounts and transactions.

## Master Data and the Data Warehouse
>  In a data warehouse, master data is often managed through dimension tables. These tables store attributes about the business entities and are used to filter, group, and label data in the warehouse, enabling comprehensive and consistent analytics.

A data warehouse is a centralized repository designed for query and analysis, integrating data from multiple sources into a consistent format. Master data is critical in a data warehouse to ensure consistency across various subject areas like sales, finance, and customer relations. Master data entities like customers, products, and employees provide a unified reference that ensures different data sources are aligned and can be analyzed together effectively.

## Master Data and the Data Lake
> Master data in a data lake context is used to tag and organize data, making it searchable and useful for specific business purposes. It can help in categorizing and relating different pieces of data within the lake, ensuring that users can find and interpret the data correctly.

A data lake is a more extensive repository that stores structured and unstructured data in its native format. While data lakes offer flexibility in handling vast amounts of diverse data, master data is essential for adding structure and meaning to this data, enabling effective analysis and utilization.

## Master Data and Data Marts
> Master data ensures that each data mart, whether for marketing, finance, or operations, uses a consistent definition and format for key business entities. This consistency is crucial for comparing and combining data across different parts of the organization.

Data marts are subsets of data warehouses designed to meet the needs of specific business units or departments. Master data is vital for data marts to ensure that the data presented is consistent with the enterprise's overall data strategy and with other departments' data marts.
