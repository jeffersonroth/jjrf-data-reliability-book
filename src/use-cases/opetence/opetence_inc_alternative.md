# Opetence Inc

Opetence Inc. stands as a beacon of ironic missteps in the e-commerce tech landscape, emblematic of a startup that has amusingly missed the mark on valuing data. It ambitiously claims the mantle of a data-centric enterprise, bringing on board a data engineer to spearhead its data infrastructure and strategy. Yet, in a twist bordering on comedic, the company systematically sidelines every piece of advice from this newly minted data team, turning the role into a symbolic gesture towards data management rather than an impactful position.

The company's CTO, with a commendable background in backend and frontend development, positions the tech team as the cornerstone of the organization—rightfully so, but not without its quirks. His views on data engineering, however, seem to be frozen in time, clinging to outdated and somewhat perplexing beliefs about the discipline's place within the company.

Opetence Inc.'s attempt to unify its technology stack across backend and data teams is a study in stubbornness.
It sticks to a rigid arsenal of Javascript microservices and an RDS Postgres database—curiously proposed as a Data Warehouse. The company's stance on database privileges is equally baffling, with the data team's hands tied, unable to perform even the most basic database administration tasks. This is justified by peculiar analogies to the backend team's access and practices, leading to the inception of bizarrely named microservices like "dba-service," "data-warehouse-service," "report-service," and the "data-lake-service," each more puzzling than the last.

The conceptualization of critical data infrastructure components is equally bewildering. The DBA role is reimagined as a microservice, tasked with ORM database migrations. The data warehouse is demoted to a mere Postgres database, lacking in access and utility for analytics. The data lake is reduced to a haphazard collection of S3 buckets, devoid of structure or strategy.

On the product side, Opetence Inc.'s vision becomes no less confounding. It envisages a single database to house a motley of operational data, third-party inputs, and real-time data streams, among other elements—a concoction ripe for security and architectural nightmares, leaving data and DevOps professionals in a perpetual state of disbelief.

In its quest for innovation, Opetence Inc. unwittingly crafts a narrative of caution, a stark reminder of the chasm between aspiration and execution in the data-driven age.

Throughout the book's use cases, we explore both hypothetical solutions proposed by the data team to address the architectural and security mishaps, and the company's own, often more perplexing, suggestions. Each case will dissect the proposed solution, its implementation, and the aftermath, aiming to present viable alternatives while highlighting key risks and offering practical advice.
