# Impediments

<p align="center">
  <img src="../../assets/concepts/systems-reliability/impediments_v1.svg" alt="System Reliability - Impediments">
</p>

## Failures, Errors, and Faults
> **Failures** are the result of unexpected internal problems that a system eventually exhibits in its external behavior. These problems are called **errors**, and their mechanical or algorithmic causes are referred to as **faults**.
> When a system's behavior deviates from what is specified for it, it is said to have a **failure**, or the system have **failed**.

Systems are composed of **components**, each of which can be considered a system in itself. Thus, a failure in one system can induce a fault in another, which may result in an error and a potential failure of this system. This can continue and produce an effect on any related system, and so on.

A faulty component of a system is one that will produce an error under a specific set of circumstances during the system's lifetime. Seen in terms of state transitions, *a system can be considered as a number of external and internal states*. 

An external state not specified in the system's behavior will be considered a system failure. The system itself consists of a number of components (each with its own states), all contributing to the system's external behavior. The combination of these components' states is called the system's internal state. *An unspecified internal state is considered an error, and the component that produced the illegal state transition is said to be faulty*.

The three types of failures:
* **Transient failures**: begin at a specific point in time, remain in the system for some period, and then disappear.
* **Permanent failures**: begin at a certain point and remain in the system until they are repaired.
* **Intermittent failures**: are transient failures that occur sporadically.

## Failure Modes
> A system can fail in many ways. A designer may design the system assuming a finite number of failure modes, however, the system may fail in ways that were not anticipated. 

We can classify the failure modes of the services that a system provides, which are:
* **Value failures**: the value associated with the service is incorrect.
* **Timing failure**: the service is completed at the wrong time.
* **Arbitrary failure**: a combination of value and timing failures.

Value failure modes are called **value domain**, and are classified into **boundary error**, and **wrong value**, where the value is outside the stipulated range.

Failures in the time domain can cause the service to be delivered:
* **Too early** (premature): the service is delivered before it is required.
* **Too late** (delayed or performance error): the service is delivered after it is required.
* **Infinitely late** (omission failure): the service is never delivered.
* **Unexpected** (commission failure or improvisation): the service is delivered without being expected.

In general, we can assume the modes in which a system can fail:
* **Uncontrolled failure**: a system that produces arbitrary errors, both in the value domain and in the time domain (including improvisation errors).
* **Delay failure**: a system that produces correct services in the value domain but suffers from timing delays.
* **Silent failure**: a system that produces correct services in both the value and time domains, until it fails. The only possible failure is omission, and when it occurs, all subsequent services will also suffer from omission failures.
* **Crash failure**: a system that has all the properties of a silent failure but allows other systems to detect that it has entered the state of silent failure.
* **Controlled failure**: a system that fails in a specified and controlled manner.
* **Failure-free**: a system that always produces the correct services.
