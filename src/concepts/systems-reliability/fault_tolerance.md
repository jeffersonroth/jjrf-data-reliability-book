# Fault Tolerance
> Given the limitations in fault prevention, especially as data and processes frequently change, it becomes necessary to resort to fault tolerance.

There are different levels of fault tolerance:
* **Full tolerance**: there is no management of adverse or unwanted conditions; the process does not adapt to validations and environmental variables or other external information for the execution of tasks.
* **Controlled degradation** (or graceful degradation): notifications are triggered in the presence of faults, and if they are significant enough to interrupt the task flow (thresholds, non-existence, or unavailability of data), branch operators will select the subsequent tasks.
* **Fail-safe**: detected faults are significant enough to determine that the process should not occur; a short-circuit or circuit breaker operator cancels the execution of subsequent tasks, stakeholders are notified, and if there is no automatic process to deal with the problem, the data team can take actions such as rerunning the processes that generate the necessary inputs or escalating the case.

The design of fault-tolerant processes assumes:
* The task algorithms have been correctly designed.
* All possible failure modes of the components are known.
* All possible interactions between the process and its environment have been considered.

## Redundancy
> All techniques used to achieve fault tolerance are based on adding external elements to the system to detect and recover from faults. These elements are redundant in the sense that they are not necessary for the system's normal operation; this is called **protective redundancy**. The goal of tolerance is to minimize redundancy while maximizing reliability, always under the constraints of system complexity and size. *Care must be taken when designing fault-tolerant systems, as components increase the complexity and maintenance of the entire system, which can in itself lead to less reliable systems*.

<p align="center">
  <img src="../../assets/concepts/systems-reliability/fault_tolerance_v1.svg" alt="Systems Reliability - Mechanisms - Fault Tolerance - Redudancy">
</p>

Redundancy in systems is classified into static and dynamic. **Static redundancy**, or masking, involves using redundant components to hide the effects of faults. **Dynamic redundancy** is redundancy within a component that makes it indicate, implicitly or explicitly, that the output is erroneous; recovery must be provided by another component. This fault tolerance technique has four phases:
1. **Error detection**: no fault tolerance action will be taken until an error has been detected.
2. **Damage confinement and assessment**: when an error is detected, the extent of the system that has been corrupted and its scope must be estimated (error diagnosis).
3. **Error recovery**: this is one of the most important aspects of fault tolerance. Error recovery techniques should direct the corrupted system to a state from which it can continue its normal operation (perhaps with functional degradation).
4. **Failure treatment and service continuation**: an error is a symptom of a failure; although the damage might have been repaired, the failure still exists, and therefore the error may recur unless some form of maintenance is performed.

### 1. Error Detection
> The effectiveness of a fault-tolerant system depends on the **effectiveness of error detection**.

Error detection is classified into:
* **Environmental detections**: Errors are detected in the environment in which the program runs. They are handled by exceptions.
* **Application detection**: Errors are detected within the application itself.
  * **Reverse checks**: Applied in components with an isomorphic relationship (one-to-one) between input and output. In this method, the output is taken and the input is calculated, which is compared with the original input value. For real numbers, inexact comparison techniques must be adopted.
  * **Rationality checks**: Based on the design and construction knowledge of the system. They verify that the state of the data or the value of an object is reasonable based on its intended use.

### 2. Damage Confinement and Assessment
> There will always be a time magnitude between the occurrence of a defect and the detection of the error, making it important to assess any damage that may have occurred in this time interval.

Although the type of error detected can provide ideas about the damage to the error handling routine, erroneous information could have been disseminated through the system and its environment. Thus, damage assessment is directly related to the precautions taken by the system designer for damage confinement. Damage confinement refers to structuring the system in such a way as to minimize the damage caused by a faulty component.

There are two main techniques for structuring systems to facilitate damage confinement: **modular decomposition** and **atomic actions**. Modular decomposition means that systems should be broken down into components, each represented by one or more modules. The interaction of the components occurs through well-defined interfaces, and the internal details of the modules are hidden and not directly accessible from the outside. This makes it more difficult for an error in one component to indiscriminately pass to another.

Modular decomposition provides the system with a static structure, while atomic actions provide it with a dynamic structure. An action is said to be atomic if there are no interactions between the activity and the system during the action. These actions are used to move the system from one consistent state to another and to restrict the flow of information between components.

### 3. Error Recovery
> Once the error situation has been detected and its possible damages have been assessed, error recovery procedures begin. This phase is probably the most important within fault tolerance techniques, which must transform an erroneous state of the system into another from which the system can continue its normal operation, perhaps with some service degradation.

Here it's worth mentioning two strategies for error recovery: **forward recovery** and **backward recovery**. Forward error recovery attempts to continue from the erroneous state by making selective corrections to the system's state, including protecting any aspect of the controlled environment that could be put at risk or damaged by the failure.

Backward recovery is based on restoring the system to a safe state before the one in which the error occurred and then executing an alternative section of the task. This will have the same functionality as the section that produced the defect, but using a different algorithm. It is expected that this alternative will not produce the same defect as the previous version, so it will rely on the designer's knowledge of the possible failure modes of this component.

The designer must be clear about the levels of service degradation, taking into account the services and processes that depend on it. Error recovery is part of the Corrective Action and Preventive Action processes (CAPA), which will be worked on in two moments: in this same chapter on fault tolerance when corrective actions are worked on, and in the next chapter, fault prevention, when preventive actions are addressed.

### 4. Failure Treatment and Continued Service
> An error is a manifestation of a defect, and although the error recovery phase may have brought the system to an error-free state, the error can recur. Therefore, the final phase of fault tolerance is to eradicate the failure from the system so that normal service can continue.