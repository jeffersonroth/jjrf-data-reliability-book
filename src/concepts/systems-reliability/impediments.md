# Impediments

<p align="center">
  <img src="../../assets/concepts/systems-reliability/impediments_v1.svg" alt="System Reliability - Impediments">
</p>

## Failures, Errors, and Faults
> **Failures** result from unexpected internal problems that a system eventually exhibits in its external behavior. These problems are called **errors**, and their mechanical or algorithmic causes are called **faults**.
> When a system's behavior deviates from its specifications, it is said to have a **failure**, or the system has **failed**.

Systems are composed of **components**, each of which can be considered a system. Thus, a failure in one system can induce a fault in another, which may result in an error and a potential failure of this system. This failure can continue and affect any related system, and so on.

A faulty system component will produce an error under specific circumstances during the system's lifetime. *A system is the sum of external and internal states* regarding state transitions.

An external state not specified in the system's behavior will be considered a failure. The system consists of many components (each with its many states), all contributing to its external behavior. The combination of these components' states is called the system's internal state. *An unspecified internal state is considered an error, and the component that produced the illegal state transition is said to be faulty*.

The three types of failures:
* **Transient failures**: Begin at a specific time, remain in the system for some time, and then disappear.
* **Permanent failures**: Begin at a certain point and stay in the system until they are repaired.
* **Intermittent failures**: These are transient failures that occur sporadically.

## Failure Modes
> A system can fail in many ways. A designer may design the system assuming a finite number of failure modes. However, the system may fail in ways that were not anticipated.

We can classify the failure modes of the services that a system provides, which are:
* **Value failures** (Value Domain): The value associated with the service is incorrect.
* **Timing failure** (Time Domain): The service is completed at the wrong time.
* **Arbitrary failure**: A combination of value and timing failures.

Failures in the value domain are classified into:
* **Boundary Error (Constraint Error)**: The value is outside the expected range of values, including errors in data typing.
* **Wrong value**: The incorrect value is within the correct range of values.

Failures in the time domain can cause the service to be delivered:
* **Too early** (premature): the service is delivered before it is required.
* **Too late** (delayed or performance error): the service is delivered after it is required.
* **Infinitely late** (omission failure): the service is never delivered.
* **Unexpected** (commission failure or improvisation): the service is delivered without being expected.

In general, we can assume the modes in which a system can fail:
* **Uncontrolled failure**: A system that produces arbitrary errors in value and time domains (including improvisation errors).
* **Delay failure**: A system that produces correct services in the value domain but suffers from timing delays
* **Silent failure**: A system that produces correct services in value and time domains until it fails. The only possible failure is omission, and when it occurs, all subsequent services will also suffer from omission failures.
* **Crash failure**: A system presenting all the properties of a silent failure but allowing other systems to detect it has entered the state of silent failure.
* **Controlled failure**: A system that fails in a specified and controlled manner.

A system consistently producing the correct services is classified as failure-free.
