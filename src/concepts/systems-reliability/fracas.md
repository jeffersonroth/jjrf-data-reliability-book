# Failure Reporting, Analysis, and Corrective Action System (FRACAS)
>
> FRACAS is a defined system or process for reporting, classifying, and analyzing failures and planning corrective actions for such shortcomings. Keeping a history of analyses and actions taken is part of the process.

The FRACAS process is cyclical and follows the adapted FRACAS Kaizen Loop:

* **Failure Mode Analysis**: Analysis of failure modes.
* **Failure Codes Creation**: Creation of failure codes or the methodology for classifying them.
* **Work Order History Analysis**: Analysis of the history of tickets sent to the data team.
* **Root Cause Analysis**: Analysis of root causes.
* **Strategy Adjustment**: Strategy adjustment.

## Implementation

Implementing this process involves automating the analysis of data process logs, commits, pull requests, and tickets. In the context of data reliability engineering, implementing it involves establishing a structured approach to systematically identifying, analyzing, and resolving data-related failures.

Here's how it can be adapted and adopted:

1. **Failure Identification**
   * **Automated Monitoring**:
     Use observability and monitoring tools to detect anomalies, failures, or performance issues in data pipelines, databases, or data processing tasks automatically. Configure all data tools to collect and send metrics.
   * **Alerting Mechanisms**:
     Set up alerts to notify relevant teams or individuals when potential data issues are detected, ensuring prompt attention.
2. **Reporting**
   * **Centralized Reporting Platform**:
     Implement a system to report, document, and track all identified issues. This platform should capture details about the failure, including when it occurred, its impact, and any immediate observations.
   * **User Reporting**:
     Encourage users and stakeholders to report data discrepancies or issues, providing a clear and straightforward mechanism.
3. **Analysis**
   * **Root Cause Analysis**:
     For each reported failure, conduct a thorough analysis to determine the underlying cause. This might involve reviewing data logs, pipeline configurations, or recent changes to the data systems.
   * **Collaboration**:
     Involve cross-functional teams in the analysis to gain diverse perspectives, especially when dealing with complex data ecosystems.
4. **Corrective Actions**
   * **Develop Solutions**:
     Based on the root cause analysis, develop appropriate solutions to address the identified issues. This could range from fixing data quality errors to redesigning aspects of the data pipeline for greater resilience.
   * **Implement Changes**:
     Roll out the corrective measures, ensuring that changes are tested and monitored to confirm they effectively resolve the issue.
5. **Follow-Up**
   * **Verification**:
     After implementing corrective actions, verify that the issue has been resolved and that the solution hasn't introduced new problems.
   * **Documentation**:
     Document the issue, the analysis process, the corrective action taken, and the implementation results for future reference.
6. **Continuous Improvement**
   * **Feedback Loop**:
     Use insights gained from FRACAS to identify areas for improvement in data processes and systems, aiming to prevent similar issues from occurring in the future.
   * **Training and Knowledge Sharing**:
     Share lessons learned from failure analyses and corrective actions with the broader team to build a continuous learning and improvement culture.

### Notes on *Failure Identification* and *Reporting* Steps

These steps can be done through automated monitoring tools that alert the team to issues such as failed ETL jobs, discrepancies in data validation checks, or performance bottlenecks.

### Notes on *Analysis* Steps

Once a failure is reported, it is analyzed to understand its nature, scope, and impact. This involves digging into logs, reviewing the data processing steps where the failure occurred, and identifying the specific point of failure. The analysis aims to classify the failure (e.g., data corruption, process failure, infrastructure issue) and understand the underlying reasons for the failure.

### Notes on *Corrective Action* Steps

Based on the analysis, corrective actions are determined and implemented to fix the immediate issue. This could involve rerunning a failed job with corrected parameters, fixing a bug in the data transformation logic, or updating data validation rules to catch similar issues in the future.

### Notes on *Follow-Up* Steps

All steps of the FRACAS process, from initial failure reporting to final corrective actions and system improvements, are documented. This documentation serves as a knowledge base for the data engineering team, helping them understand common failure modes, effective corrective actions, and best practices for designing more reliable data systems.

### Notes on *Continuous Improvement* Steps

Beyond immediate corrective actions, FRACAS also focuses on systemic improvements to prevent similar failures from occurring. This could involve redesigning parts of the data pipeline for greater resilience, adding additional checks and balances in data validation, improving data quality monitoring, or enhancing the infrastructure for better performance and reliability.

FRACAS is an iterative process. The learnings from each incident are fed back into the data engineering processes, leading to continuous improvement in data pipeline reliability and efficiency. Over time, this reduces the incidence of failures and improves the overall quality and trustworthiness of the data.

## Tools and Integration

Integrate FRACAS with existing data management and DevOps tools to streamline the workflow. This integration can range from linking FRACAS with project management tools to automating specific steps in the process using scripts or bots.

Implementing FRACAS in data reliability engineering helps resolve data issues more effectively and contributes to building a more reliable, resilient, and high-quality data infrastructure over time.

## Use Case

Although complete use cases will be explored in the book's next section, here's a small use case to understand the implementation and importance of FRACAS.

### Background

A mature startup, "PaTech," has a complex data ecosystem with Airflow orchestrating ELT jobs via Airbyte, ETL processes through dbt models deployed in Kubernetes, and various data quality and observability tools like DataDog in place. Hundreds of engineers access the company's data lake and warehouse, while its data marts serve thousands of employees across all departments.

### Challenge

Despite having advanced tools and processes, DataTech Innovations faces recurring data issues affecting data quality and availability, leading to decision-making delays and decreased trust in data systems.

### FRACAS Implementation

1. **Failure Identification**:
  An anomaly detected by DataDog in the data warehouse triggers an alert. The issue involves a significant discrepancy in sales data reported by the ETL process, impacting downstream data marts and reports.
2. **Initial Reporting**:
  The alert automatically generates a Jira ticket, categorizing the issue as a high-priority data quality incident. The ticket includes initial diagnostic information from DataDog and Airflow logs.
3. **Data Collection and Analysis**:
  The data reliability engineering team, using logs from Airflow and Airbyte, identifies that a recent schema change in the source CRM system wasn't reflected in the ELT job, leading to incomplete sales data extraction.
4. **Root Cause Analysis (RCA)**:
  Further investigation reveals that the change notification from the CRM team was overlooked due to a communication gap, preventing the necessary adjustments in the ELT job.
5. Corrective Actions:
   * **Immediate**:
     The ELT job is temporarily halted, and the schema change is manually incorporated to restore the integrity of the sales data. The corrected data is re-processed, and the affected data marts and reports are updated.
   * **Systemic**:
     The team implements a new protocol for schema change notifications, including automated alerts and a checklist in the Airflow job deployment process to verify source system schemas.
6. **Preventive Measures**:
   * Introducing automated schema detection and validation in Airbyte to flag discrepancies before data extraction.
   * Establishing a cross-functional data schema change committee to ensure all schema changes are reviewed and communicated effectively across teams.
7. **Documentation and Knowledge Sharing**:
  The incident, RCA, corrective, and preventive measures are documented in the company's knowledge base. A company-wide presentation is conducted to share learnings, emphasizing the importance of communication and automated checks in preventing similar incidents.
8. **Monitoring and Review**:
  DataDog alerts are fine-tuned to detect similar anomalies more effectively. The effectiveness of the new schema change protocol and automated checks are monitored over the next quarter to ensure no repeat incidents.

### Outcome

By implementing FRACAS, PaTech resolves the immediate data discrepancy issue and strengthens its data reliability framework, reducing the likelihood of similar failures. The incident fosters a culture of continuous improvement and cross-departmental collaboration, enhancing overall data trustworthiness and decision-making efficiency across the organization.

## Final Thoughts

By applying FRACAS, data teams can move from reactive problem-solving to a proactive stance on improving data systems' reliability and efficiency, ultimately supporting better decision-making and operational performance across the organization.
