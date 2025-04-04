```admonish warning title="Page under construction"
:construction:
```

# Fault Prevention: Elimination
>
> The second phase of fault prevention is fault elimination. This phase typically involves procedures to find and eliminate the causes of errors.

Although techniques such as code reviews (e.g. linters) and local debugging are used, peer reviews and exhaustive testing with various combinations of input states and environments are not always carried out.

QA testing cannot verify that output values are compatible with the business and its applications, so it usually focuses on time-related failure modes (such as timeouts) and **defects**. Unfortunately, system testing cannot be exhaustive and eliminate all potential faults, mainly due to:

* Tests are used to demonstrate the presence of faults, not their absence.

* The difficulty of performing tests in production. Testing failures in production are akin to **live combat**, meaning the consequences of errors can directly impact the business, leading to potentially poor decisions. For example, an incorrect calculation of a KPI can lead to erroneous actions and decrease the business's confidence in the data processes.

* Errors introduced during the system requirements stage may not manifest until the system is operational. For example, a DAG (Directed Acyclic Graph) is scheduled to run when the data source is not yet available or complete. For this specific example, sensors might be implemented to only continue the execution when the data source is available or fail if not available within a particular timeframe (timeout).
