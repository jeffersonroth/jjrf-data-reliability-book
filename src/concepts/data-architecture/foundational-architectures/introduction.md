```admonish warning title="Page under construction"
:construction:
```

# Foundational Architectures

Foundational Architectures in data systems refer to the underlying structural frameworks that dictate the organization, storage, processing, and flow of data within and across information systems.
These architectures are "foundational" because they serve as the basic models upon which more complex and specialized data systems can be constructed.
Understanding these architectures is crucial for data reliability engineers, as the choice of architecture impacts the system's resilience, performance, and maintainability.

```admonish tldr title="Single-Tier Architecture"
A [single-tier architecture](./single_tier_architecture.md), often synonymous with standalone databases or applications, encapsulates data storage, processing, and presentation within a single layer or platform.
This architecture is characterized by its simplicity and is typically used for smaller, less complex systems where all operations occur on a single device or server.
```

```admonish tldr title="Two-Tier Architecture"
The [two-tier architecture](./two_tier_architecture.md) separates the client (presentation layer) and the server (data layer), with the client directly interacting with the server's database.
It marks the beginning of client-server models, enhancing data management capabilities and user access flexibility compared to single-tier systems.
```

```admonish tldr title="Three-Tier Architecture"
The [three-tier architecture](./three_tier_architecture.md) further separates concerns by introducing an intermediary layer between the client and the database, known as the application layer or business logic layer.
This architecture improves scalability, security, and manageability by isolating user interface, data processing, and data storage functions.
```

```admonish tldr title="N-Tier Architecture"
The [N-tier architecture](./n_tier_architecture.md) architecture expands upon the three-tier model by introducing additional layers or tiers, allowing for greater separation of concerns, scalability, and flexibility.
Each tier is dedicated to a specific function, such as presentation, application processing, business logic, and data management, with the potential for further subdivisions to address specific scalability or functionality requirements.
```
