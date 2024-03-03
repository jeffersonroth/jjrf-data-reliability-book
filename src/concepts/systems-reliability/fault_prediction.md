# Failure Prediction
> Accurate and rapid prediction of failures allows those of us maintaining processes to ensure higher service availability. Unfortunately, failure prediction is much more complex than detection.

To predict a failure, it must be identified and classified. Failures must also be predictable, meaning there are system (and component) state changes that lead to failure, or the failure occurs regularly following some pattern. Both cases can be translated into time series prediction problems, and sensor and log data can be used to train prediction models.

The collected data will hardly be ready for use by prediction models, so one or more preprocessing tasks must be carried out:
* **Data synchronization**: metrics collected by various agents must be aligned in time.
* **Data cleaning**: removing unnecessary data and generating missing data (e.g., interpolation).
* **Data normalization**: metric values are normalized to make magnitudes comparable.
* **Feature selection**: relevant metrics are identified for use in the models.

Once the data is preprocessed, it will be used in two pipelines: a training pipeline and an inference pipeline. The training pipeline uses bulk data to train the model to be made available to the inference pipeline. The inference results will indicate the presence or absence of specific types of failures in the monitored metric sample.
