# Data Mesh

```admonish warning title="Page under construction"
:construction:
```

Data Mesh is an architectural and organizational paradigm that treats data as a product, emphasizing domain-oriented decentralized data ownership and architecture.
It's particularly suitable for large organizations with complex and distributed data landscapes.
In a Data Mesh framework, data is managed and owned by domain-specific teams who treat their data as products, making it discoverable, addressable, and securely accessible to other teams within the organization.

**Fundamental Concepts of Data Mesh**:

* **Domain-Oriented Decentralized Data Ownership**: Data is owned and managed by domain-specific teams responsible for the full lifecycle of their data products, from creation to serving to end-users.
* **Data as a Product**: Data assets are treated as products, with a focus on user needs, usability, and quality. Each data product should have clear ownership, documentation, SLAs, and versioning.
* **Self-Serve Data Infrastructure**: To enable domain teams to manage their data products effectively, a self-serve data platform is provided. This platform offers tools and services that abstract away the complexity of underlying data technologies, enabling teams to easily ingest, store, manage, and serve their data.
* **Federated Computational Governance**: Governance policies and standards are applied across the organization, but the domain teams handle implementation details. This approach allows for global consistency in areas like security and compliance while enabling localized flexibility and innovation.

Implementing a Data Mesh architecture can vary significantly depending on the size and complexity of the organization.
Here are examples tailored to small, medium, and large companies:

```admonish example title="Small Companies"
In a small company, resources are often limited, and the focus is on agility and rapid growth.
A Data Mesh might look like a lightweight, informal version of the full paradigm.

* **Domain Identification**: With fewer and less complex domains, a small company might only have a handful of domains, such as Sales, Marketing, and Product. Each domain could be managed by a small team or even a single individual.
* **Data Product Ownership**: Given the size, individuals or small teams could take on multiple roles, including data product ownership, combining this responsibility with their regular duties.
* **Self-Serve Data Infrastructure**: The infrastructure might rely heavily on managed services to reduce overhead, using tools like Google BigQuery, AWS RDS, or MongoDB Atlas for data storage and processing, with simple, user-friendly tools for data integration and analysis.
* **Governance and Collaboration**: Governance might be more informal, with a focus on practical, lightweight guidelines that encourage data sharing and reuse. Regular team meetings and shared tools could facilitate cross-domain collaboration.
```

```admonish example title="Medium-sized Companies"
As companies grow, the data landscape becomes more complex, but they may not yet have the resources for a fully-fledged Data Mesh.

* **Domain Identification**: Domains become more defined, with clear boundaries and dedicated teams for areas like Customer Support, Operations, Finance, etc.
* **Data Product Ownership**: Specific roles for data product owners might be established, with individuals or small teams dedicated to managing the data lifecycle within their domain.
* **Self-Serve Data Infrastructure**: The data platform might be more sophisticated, potentially involving custom development to meet specific needs and the use of managed services for scalability. Tools like Apache Airflow for orchestration and dbt for transformations might be employed.
* **Governance and Collaboration**: Formal governance structures start to take shape, with clear policies for data quality, security, and privacy. A central data team that facilitates sharing, standards, and best practices might support cross-domain collaboration.
```

```admonish example title="Large Companies"
With their complex and distributed data ecosystems, large organizations can fully embrace the Data Mesh paradigm, though it requires significant investment in culture, processes, and technology.

* **Domain Identification**: Numerous domains exist across various business units, each with its complexities. Domains are well-defined, with dedicated teams and significant autonomy.
* **Data Product Ownership**: Data product owners are well-established roles with clear responsibilities for the end-to-end management of their data products. These owners work closely with domain experts to ensure data meets the needs of its consumers.
* **Self-Serve Data Infrastructure**: A robust, scalable self-serve platform is crucial, possibly involving a mix of custom-built and managed services. This platform would offer advanced capabilities for data ingestion, processing, governance, and serving, tailored to the diverse needs of domain teams.
* **Governance and Collaboration**: A federated governance model is in place, with central oversight ensuring compliance with regulatory and organizational standards while allowing flexibility in implementation. Tools like data catalogs and marketplaces facilitate discovery and collaboration across domains.
```

In each of these examples, the implementation of Data Mesh principles needs to be adapted to the organization's scale, maturity, and specific challenges, ensuring that the architecture remains practical and aligned with business objectives.

## Use Case

Suppose the CEO of [Opetence Inc.](../../../use-cases/opetence/opetence_inc.md) comes across a LinkedIn post discussing the advantages of Data Mesh.
In such a situation, the CTO is asked to prepare a proposal to enable individual teams/verticals to be more data-driven and self-sufficient in creating their own dashboards and reports.

The CTO then requests the data team, consisting of two data engineers and two analytics engineers, to develop a comprehensive plan in collaboration with the product teams to enhance the company's data capabilities.
This initiative arises from the company's diverse and growing needs across the different teams/verticals, mainly E-commerce, Orders, Logistics, Users, Marketing, and Finances.

Before crafting this plan, the data team collected essential information to ensure a thorough understanding of the current state and expectations.
They noted the company's interest in detailed metrics like vendor performance by microzone, user cohort analysis, logistics operations efficiency, user engagement across platforms, marketing ROI, and financial accuracy.
Additionally, they acknowledged the structure of the product teams, each led by a product owner with an analyst who possesses basic Tableau and SQL skills.
The plan includes leveraging these skills in a self-serve data environment where the product teams can access and analyze data independently, thereby enhancing the company's data capabilities.

### Plan Outline

Given Opetence Inc.'s diverse needs and the data team's size constraints, a well-thought-out plan must balance complexity, maintainability, and the capacity to deliver actionable insights to different stakeholders.
The plan should leverage Data Mesh principles to meet domain-specific data needs while maintaining a manageable and scalable architecture.
The first draft was discussed as follows:

* **Domain Identification and Ownership**:
  * Identify key domains, aligning each with the corresponding product team.
  * Establish a data product owner role within each product team. This person will define the data requirements, ensure data quality, and liaise with the data team.
* **Data Infrastructure and Architecture**:
  * Utilize cloud-native services to minimize infrastructure management, such as AWS Lake Formation for data lake, Redshift for warehousing, and Aurora for operational databases.
  * Implement a self-serve data platform that empowers analysts in each product team to access, query, and analyze data relevant to their domain and create custom reports and dashboards.
* **Data Products and Mart Creation**:
  * The analytics engineers will work closely with domain owners to develop data marts using dbt tailored to each domain's specific needs, ensuring that the data models reflect the key metrics and KPIs relevant to each domain.
* **Monitoring and Quality Control**:
  * Develop a centralized monitoring and quality control system that tracks the health, performance, and accuracy of data pipelines and data products.
  * Implement data quality frameworks that automate the detection of anomalies, inconsistencies, and quality issues in the data, alerting domain owners and data engineers to take corrective actions.
* **Training and Enablement**:
  * Provide training sessions and resources for product team analysts to enhance their SQL and Tableau skills, ensuring they can effectively leverage the self-serve platform and data marts.
  * Develop comprehensive documentation and user guides for the data infrastructure, data models, and key data products, facilitating self-service analytics.
* **Collaboration and Feedback Loops**:
  * Establish regular cross-functional meetings between the data team, data product owners, and analysts to review data needs, discuss new requirements, and share insights and best practices.

The data team identified the following risks and mitigation strategies:

* **Complexity and Overhead**: Given the small size of the data team, there's a risk of becoming overwhelmed. The plan must prioritize automation and managed services to reduce overhead.
* **Data Governance and Security**: With multiple domains accessing and manipulating data, ensuring data security and compliance becomes challenging. The plan must contemplate the implementation of fine-grained access controls and audit logs to monitor data access and modifications.
* **Vendor Lock-in**: Relying heavily on a single cloud provider can lead to vendor lock-in. The plan should consider using open standards and formats for data storage and processing.

After consulting with the CTO and product teams, it became evident that product owners are keen on acquiring basic skills in Tableau and SQL to investigate data and run simple queries. However, due to certain constraints, such as a lack of AWS users, analysts and product owners do not have direct access to Redshift, and they require Single Sign-On (SSO) capabilities to use corporate emails for login. The selected solution was to utilize the existing Redash and Tableau infrastructure, as both support SSO integration, enabling users to log in smoothly with their corporate email accounts. This solution offers an intuitive interface without requiring direct access to the underlying data warehouse. Additionally, the data team could design a training program customized to the product owners' and analysts' skill levels to support this initiative, with a focus on basic SQL and Tableau usage. This program could comprise hands-on workshops, curated learning resources, and regular Q&A sessions to build confidence and proficiency in data exploration and visualization.

Redash is an easy-to-use platform perfect for product owners and analysts who want to run queries and analyze data.
The interface is SQL-friendly, which makes it particularly useful for those with basic SQL knowledge.
Redash's dashboards are simple to understand and provide an easy way to visualize query results, making it an ideal tool for exploring data.

Tableau, on the other hand, offers more advanced visualization and dashboarding functions.
Its drag-and-drop interface and wide range of visualization options make it suitable for creating complex reports and dashboards.
To enable access to Redshift without direct AWS credentials, the data team can configure Tableau to connect to Redshift through a service account they manage.
This ensures secure access to data without exposing sensitive credentials.

The data team has emphasized to the CTO the importance of incorporating version control while creating dashboards and reports.
They have pointed out the potential risks associated with the lack of such a system.
To mitigate these risks, it was decided that the code for critical dashboards and reports would be version-controlled, using GitHub, and managed by the data team.
This approach ensures traceability, promotes collaboration and allows for the rollback of changes if necessary.

Product teams must submit tickets to the analytics team for modifying or creating dashboards.
This delineates a clear process for changes while absolving the data team accountable for any unversioned dashboard alterations.
While product teams retain the autonomy to craft and modify their dashboards and reports, they are not allowed to alter official ones, thereby preserving the integrity of critical data visualizations.

Redash's process involves submitting tickets to create views and tables within official schemas.
Meanwhile, product teams can only create such assets within their respective sandbox environments.
This approach ensures a structured yet flexible way of managing data across the organization.

### Summary of Data Mesh project

This initiative encompasses several crucial strategies:

* **Domain-Specific Data Products**: Each domain has a data product owner who manages domain-specific data products to deliver high-quality, tailored data solutions.
* **Cloud-Native Data Infrastructure**: Establish a scalable and manageable data infrastructure by adopting AWS Lake Formation for data lakes, Redshift for data warehousing, and Aurora for operational databases.
* **Self-Service Analytics**: Give access to Redash and Tableau to enable teams to independently create and explore insights while ensuring they cannot modify official data products.
* **Sandbox Environment**: In Redash, teams can experiment with creating tables and views in sandbox environments while having read-only access to official schemas.
* **Version Control and Change Management**: Use GitHub to enforce version control of crucial dashboards and reports, maintaining integrity and traceability. Changes to these assets will be managed via a ticketing process, ensuring transparency and accountability for modifications.
* **Ownership and Responsibility**: The data team is responsible for version-controlled dashboards and reports only, guaranteeing consistency in official data products.
* **Training and Enablement**: Develop training programs that promote data literacy and self-service capabilities to enhance the SQL and Tableau skills of product team owners and analysts.
* **Data Governance and Security**: Establish strict data governance policies and security measures, including SSO integration for secure access and detailed access controls to protect data integrity.
* **Collaborative Workflow and Feedback**: Promote collaborative workflows and feedback mechanisms to continuously refine data products based on user feedback and evolving needs.

### Risks and Next Steps

If Opetence Inc. proceeds with the Data Mesh project using the proposed strategies, it is crucial to address several risks to ensure successful implementation and ongoing management of the new systems:

* **Data Discrepancies**: There is a risk of data discrepancies when product teams create their own dashboards and reports due to non-official queries or poorly written SQL, leading to misinformed decisions and undermining trust in the data ecosystem.
* **Increased Load on the Analytics Team**: Product teams may inundate analytics teams with requests for data verification, troubleshooting, or optimizing inefficient queries, overburdening them.
* **Data Governance and Quality**: With increased data accessibility and the creation of sandbox environments, maintaining data quality and governance standards becomes challenging. Ensuring compliance with data policies and preventing data breaches or leaks is crucial.
* **Training and Adoption**: The success of the self-service model depends heavily on effective training and adoption by product teams. Inadequate training or low adoption rates can limit the benefits of new tools and processes.
* **Version Control Compliance**: It is critical to strictly adhere to version control and formal change management processes for all critical reports and dashboards. Failure to comply may result in undocumented changes, making it difficult to track issues or revert to stable versions.

To mitigate these risks and ensure the successful rollout of the new data infrastructure, the data team should consider the following next steps:

* **Establish Clear Guidelines**: Develop comprehensive guidelines for creating queries, dashboards, and reports, emphasizing best practices in SQL writing and data visualization.
* **Implement Robust Data Governance Policies**: Strengthen data governance frameworks to ensure data quality, security, and compliance across all levels of data access and manipulation.
* **Continuous Training and Support**: Offer ongoing training sessions and support for product teams to improve their data handling skills, focusing on understanding the impact of their queries and reports on system performance and data integrity.
* **Monitor and Optimize**: Regularly monitor the performance of the data infrastructure, especially areas accessible to product teams, to identify and optimize inefficient queries and ensure system health.
* **Feedback Loops and Collaboration**: Establish structured feedback loops and foster collaboration between the data team, product teams, and other stakeholders to share insights, address challenges, and continuously improve data products and processes.

### Final Thoughts

In reflecting on the comprehensive strategy devised for Opetence Inc., it becomes evident that while the current plan lays a solid foundation for empowering product teams and enhancing data infrastructure, **the company would better benefit from further expanding its analytics team** and aspiring towards a more fully developed data mesh architecture.
These improvements would not only continue the progress toward self-service data exploration but also ensure that dedicated expertise is available to manage and fulfill official data requests.

Expanding the analytics team would alleviate some of the challenges anticipated with the self-service model, such as the potential for data discrepancies and the additional load on the existing team to verify and optimize queries.
With more hands on deck, the analytics team could offer targeted support, ensuring high-quality data practices and fostering a more profound analytical culture across the company.

Transitioning towards a data mesh architectural paradigm would involve decentralizing data ownership and management, treating data as a product with domain-oriented teams responsible for their data products.
This shift would encourage a more collaborative and efficient data ecosystem, where product teams have the autonomy to explore and innovate within their domains while relying on the analytics team for guidance and expertise in data modeling, governance, and architecture.

By investing in these areas, Opetence Inc. can build upon its current data strategy to create a more robust, scalable, and user-centric data environment.
This approach would not only enhance operational efficiency and decision-making capabilities but also position the company to adapt swiftly to future data challenges and opportunities, ensuring its long-term success in an increasingly data-driven landscape.
