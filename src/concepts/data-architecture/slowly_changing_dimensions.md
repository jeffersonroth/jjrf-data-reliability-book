# Slowly Changing Dimensions (SCD)
Slowly Changing Dimensions (SCDs) are concepts in data warehousing used to manage and track changes in dimension data over time. Dimensions in data warehousing refer to descriptive attributes related to business entities, such as products, customers, or geographical locations, which can change over time. Managing these changes accurately is crucial for historical reporting, trend analysis, and decision-making.

## Type 0: Fixed Dimension
> No changes are allowed. The dimension data is static, and any updates to the source data are ignored.

Suitable for data that doesn't change, such as historical data, fixed identifiers, or regulatory codes.

## Type 1: Overwrite
> Updates overwrite existing records, with no history of previous values being kept. This approach is simple but sacrifices historical accuracy.

Appropriate when historical data isn't necessary for analysis, or for correcting minor errors in dimension attributes.

## Type 2: Add New Row
> This approach involves adding a new row with the updated values while retaining the old rows to preserve history. Typically, attributes like "valid from," "valid to," and "current indicator" are used to manage the versioning of records.

Essential for detailed historical tracking where it's important to know the state of the dimension at any point in time, such as tracking address changes for a customer.

## Type 3: Add New Attribute
> Involves adding new attributes to store the current and previous values of the changed dimension. It's limited in historical tracking as it usually only keeps the last change.

Useful when only the most recent historical data is needed, such as tracking the previous and current manager of an employee.

## Type 4: History Table
> Separates the current data from historical data by maintaining a current table (similar to Type 1) and a separate history table (similar to Type 2) to track changes over time.

Beneficial for performance optimization, as it keeps the main dimension table smaller and more efficient for queries, while still allowing historical analysis.

## Hybrid: Combination of Types
> Combines features from different types to suit specific needs. A common hybrid approach is using Type 2 with a current indicator flag or combining Type 2 for historical tracking with Type 1 attributes for frequently changing attributes where history isn't needed.

A good fit for complex scenarios where different attributes of the dimension require different types of change management. For example, storing a complete history of address changes (Type 2) while only keeping the current phone number (Type 1).

## Considerations
* **Data Volume**:
  SCD Type 2 and Type 4 can significantly increase data volume due to the historical records they generate.

* **Query Complexity**:
  SCD Type 2 and hybrids can introduce complexity into queries, as they require filtering for current or specific historical records.

* **Performance**:
  Type 1 and Type 0 are generally more performant for queries due to the lack of versioning but at the cost of historical accuracy.

In practice, the choice of SCD type depends on the specific business requirements, the importance of historical accuracy, query performance needs, and the complexity that the organization can manage. It's not uncommon for a single data warehouse to employ multiple SCD types across different dimensions based on these considerations.
