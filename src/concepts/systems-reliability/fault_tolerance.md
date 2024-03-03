# Fault Tolerance
> Given the limitations in fault prevention, especially as data and processes frequently change, it becomes necessary to resort to fault tolerance.

There are different levels of fault tolerance:
* **Full tolerance**: there is no management of adverse or unwanted conditions; the process does not adapt to internal or external values.
* **Controlled degradation** (or graceful degradation): notifications are triggered in the presence of faults, and if they are significant enough to interrupt the task flow (thresholds, non-existence, or unavailability of data), branch operators will select the subsequent tasks.
* **Fail-safe**: detected faults are significant enough to determine that the process should not occur; a short-circuit or circuit breaker operator cancels the execution of subsequent tasks, stakeholders are notified, and if there is no automatic process to deal with the problem, the data team can take actions such as rerunning the processes that generate the necessary inputs or escalating the case.

The design of fault-tolerant processes assumes:
* The task algorithms have been correctly designed.
* All possible failure modes of the components are known.
* All possible interactions between the process and its environment have been considered.

## Redundancy
> All available fault techniques include adding external elements to the system to detect and recover from faults. These elements are redundant in the sense that they are not necessary for the system's normal operation; this is called **protective redundancy**. The goal of tolerance is to minimize redundancy while maximizing reliability, always under system complexity and size constraints. *Care must be taken when designing fault-tolerant systems, as components increase the complexity and maintenance of the entire system, which can in itself lead to less reliable systems*.

<p align="center">
  <img src="../../assets/concepts/systems-reliability/fault_tolerance_v1.svg" alt="Systems Reliability - Mechanisms - Fault Tolerance - Redudancy">
</p>

Systems Redundancy is classified into static and dynamic. **Static redundancy**, or masking, involves using redundant components to hide the effects of faults. **Dynamic redundancy** is redundancy within a component that makes it indicate, implicitly or explicitly, that the output is erroneous; another component must provide recovery. This fault tolerance technique has four phases:

1. **Error detection**: no fault tolerance action will be taken until an error has been detected.
2. **Damage confinement and assessment**: when an error is detected, the extent of the system that has been corrupted and its scope must be estimated (error diagnosis).
3. **Error recovery**: one of the most critical aspects of fault tolerance. Error recovery techniques should direct the corrupted system to a state from which it can continue its normal operation (perhaps with functional degradation).
4. **Failure treatment and service continuation**: an error is a failure symptom; although the damage might have been repaired, the failure still exists, and therefore, the error may recur unless some form of maintenance is performed.

### 1. Error Detection
> The effectiveness of a fault-tolerant system depends on the **effectiveness of error detection**.

Error detection is classified into:
* **Environmental detections**: Errors are detected in the application's environment and handled by exceptions.
* **Application detection**: Errors are identified in the application itself.
  * **Reverse checks**: Applied in components with an isomorphic relationship (one-to-one) between input and output. This method calculates an input value from the output value, which is then compared with the original. Inexact comparison techniques must be adopted when dealing with real numbers.
  * **Rationality checks**: Based on the design and construction knowledge of the system. They verify that the state of the data or the value of an object is reasonable based on its intended use.

### 2. Damage Confinement and Assessment
> There will always be a time magnitude between the occurrence of a defect and the detection of the error, making it essential to assess any damage that may have occurred in this time interval.

Although the type of error detected can help evaluate the damage - when performing the error handling routine - erroneous information could have been disseminated through the system and its environment. Thus, damage assessment is directly related to the precautions taken by the system designer for damage confinement. Damage confinement refers to structuring the system in such a way as to minimize the damage caused by a faulty component.

**Modular decomposition** and **atomic actions** are two main techniques for structuring systems to facilitate damage confinement. Modular decomposition means that systems should be broken down into components, each represented by one or more modules. The interaction of the components occurs through well-defined interfaces, and the internal details of the modules are hidden and not directly accessible from the outside. This structuring makes it more difficult for an error in one component to propagate to another.

Modular decomposition provides a static structure, while atomic actions structure the system dynamically. An action is said to be atomic if there are no interactions between the activity and the system during the action. These actions move the system from one consistent state to another and restrict information flow between components.

### 3. Error Recovery
> Error recovery procedures begin once the detected error state and its possible damages have been assessed. This phase is the most important within fault tolerance techniques, which must transform an erroneous state of the system into another from which it can continue its normal operation, perhaps with some service degradation.

**Forward recovery** and **backward recovery** are the most common error recovery strategies. The forward error recovery attempts to continue from the erroneous state by making selective corrections to the system's state, including protecting any aspect of the controlled environment that could be put at risk or damaged by the failure.

The backward recovery strategy consists of restoring the system to a safe state before the one in which the error occurred and then executing an alternative section of the task. This section will have the same functionality as the section that produced the defect but using a different algorithm. It is expected that this alternative will not produce the same defect as the previous version so that it will rely on the designer's knowledge of the possible failure modes of this component.

The designer must be clear about the service degradation levels, considering the services and processes that depend on it. Error recovery is part of the [Corrective Action and Preventive Action processes (CAPA)](./corrective_actions.md).

### 4. Failure Treatment and Continued Service
> An error is a manifestation of a defect, and although the error recovery phase may have brought the system to an error-free state, the error can recur. Therefore, the final phase of fault tolerance is to eradicate the failure from the system so that normal service can continue.
