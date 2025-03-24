```admonish warning title="Page under construction"
:construction:
```

# Attributes

## Reliability

```admonish tip title="Reliability Attribute"
*Reliability* is the probability *R(t)* that the system will **continue functioning at the end of the process**.
```

The time *t* is measured in continuous working hours between diagnostics.
The constant failure rate &lambda; is measured in *failures/hour*.
The useful life of a system component is the constant region (on a logarithmic scale) of the curve between the component's age and its failure rate.
The region of the graph before equilibrium is the burn-in phase, and the region where the failure rate starts to increase is the end-of-life phase.
Thus, we have *R(t) = exp(-&lambda;t)*.

## Availability

```admonish tip title="Availability Attribute"
*Availability* is the measure of the **frequency of incorrect service periods**.
```

## Dependability

```admonish tip title="Dependability Attribute"
Continuity of service delivery.

It is a measure (probability) of the **success with which the system conforms to the definitive specification of its behavior**.
```

## Safety

```admonish tip title="Safety Attribute"
*Safety* is the absence of conditions that can cause damage and the propagation of **catastrophic damage** in production.
```

However, as this definition can classify virtually any process as unsafe, we often consider the term **mishap**.

```admonish tip title="Mishap"
A *Mishap* is an **unplanned event** or sequence of events that can produce catastrophic damage.
```

Despite its similarity to the definition of *Dependability*, there is a crucial difference in emphasis:  *Dependability* is the measure of success with which the system conforms to the specification of its behavior, typically in terms of probability, while *Safety* is the improbability of conditions leading to a mishap occurring, regardless of whether the intended function is performed.

## Integrity

```admonish tip title="Integrity Attribute"
*Integrity* is the absence of conditions that can lead to inappropriate alterations of data in production.
```

## Confidentiality

```admonish tip title="Confidentiality Attribute"
*Confidentiality* is the absence of unauthorized data access.
```

## Maintainability

```admonish tip title="Maintainability Attribute"
*Maintainability* is the ability to undergo repairs and evolve.
```

## Scalability

```admonish tip title="Scalability Attribute"
*Scalability* is the ability to adapt to business needs.
```

## Deficiencies

```admonish tip title="Deficiencies Attribute"
*Deficiencies* are circumstances that cause or are a product of **unreliability**.
```
