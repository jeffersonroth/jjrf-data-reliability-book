```admonish warning title="Page under construction"
:construction:
```

# Validity Dimension in Data Quality
>
> Validity in data quality refers to the degree to which data conforms to specific syntax (format, type, range) and semantic (meaningful and appropriate content) rules defined by the data model and business requirements. Valid data adheres to predefined formats, standards, and constraints, ensuring that it is both structurally sound and contextually meaningful for its intended use.

## Validity Metrics

Assessing validity involves checking data against established rules and constraints to ensure it meets the required standards for format, type, range, and content. Here's how validity can be evaluated across different stages of the data infrastructure:

### Data Sources (Operational Data) - Format Conformance Rate

\\[ Format \ Conformance \ Rate = \frac{Number\ of \ Records \ Meeting \ Format \ Specifications}{Total \ Number \ of \ Records} \times 100 \\]

**Application**: Analyze operational data to ensure that it conforms to expected formats (e.g., date formats, postal codes). This can be done using SQL queries or data profiling tools to check data formats against predefined patterns.

### Data Lakes and Data Warehouses - Data Type Integrity Score

\\[ Data \ Type \ Integrity \ Rate = \frac{Number \ of \ Records \ with \ Correct \ Data \ Types}{Total \ Number \ of \ Records} \times 100 \\]

**Application**: In data lakes and warehouses, assess the integrity of data types to ensure that data is stored in the correct format (e.g., numeric fields are stored as numbers). Automated data quality tools can scan datasets to identify type mismatches.

### Data Marts - Business Rule Compliance Rate

\\[ Business \ Rule \ Compliance \ Rate = \frac{Number \ of \ Records \ Complying \ with \ Business \ Rules}{Total \ Number \ of \ Records} \times 100 \\]

**Application**: For data marts, ensure that data complies with specific business rules relevant to the department or function. This involves setting up rule-based validation checks that can be run on the data mart contents.

## Ensuring and Improving Validity

Strategies to maintain and enhance data validity across the data infrastructure include:

* **Validation Rules and Constraints**:
  Implement comprehensive validation rules and constraints at the point of data entry and throughout data processing pipelines to ensure data validity.

* **Data Quality Tools**:
  Utilize data quality tools that offer automated validation capabilities, allowing for the continuous checking of data against validity rules.

* **Data Cleansing**:
  Engage in regular data cleansing activities to correct invalid data, using scripts or data quality platforms to identify and rectify issues.

* **Metadata Management**:
  Maintain detailed metadata that specifies the valid format, type, and constraints for each data element, guiding data handling and validation processes.

* **User Education and Guidelines**:
  Educate users involved in data entry and management about the importance of data validity and provide clear guidelines and training on maintaining it.

## Validity Metrics Examples

For the validity dimension in data quality, ensuring that data adheres to both structural and contextual rules is crucial. Here are some examples of validity metrics that can be applied in various business contexts:

### Format Compliance Rate

**Application**: Measure the percentage of data entries that adhere to predefined format rules (e.g., date formats, phone numbers).

**Example**: A customer service database might track the format compliance rate for customer phone numbers to ensure they are stored in a uniform and usable format.

### Data Type Integrity Rate

**Application**: Quantify the proportion of data that matches the expected data types defined in the data model (e.g., integers, strings).

**Example**: A financial system may monitor the data type integrity rate for transaction amounts to ensure they are recorded as numeric values, not strings.

### Range and Boundary Adherence Rate

**Application**: Evaluate the percentage of data entries that fall within acceptable range limits or boundaries (e.g., age, salary caps).

**Example**: An HR system could track the adherence rate of employee salaries to ensure they fall within the defined salary bands for their roles.

### Referential Integrity Compliance

**Application**: Assess the extent to which foreign key values in a database table correctly reference existing primary keys in another table, ensuring relational integrity.

**Example**: An e-commerce platform might measure referential integrity compliance to ensure that all order records correctly reference existing customer records.

### Mandatory Fields Completion Rate

**Application**: Measure the percentage of records that have all mandatory fields filled, ensuring completeness and validity.

**Example**: A lead generation form might track the completion rate of mandatory fields to ensure that leads are captured with all necessary information.

### Logical Consistency Check Rate

**Application**: Quantify the proportion of data that passes logical consistency checks (e.g., a child's birth date being after the parent's birth date).

**Example**: A healthcare application may monitor the logical consistency check rate for patient and family records to ensure logical relationships are maintained.

### Pattern Matching Success Rate

**Application**: Evaluate the success rate at which data entries match predefined patterns (e.g., email address patterns, product codes).

**Example**: An online registration system could track the pattern-matching success rate for email addresses to ensure they follow a valid email format.

By implementing these validity metrics, organizations can ensure that their data is not only structurally sound but also contextually appropriate for its intended use. Ensuring data validity is essential for maintaining the integrity of data systems and for supporting accurate, reliable decision-making processes.
