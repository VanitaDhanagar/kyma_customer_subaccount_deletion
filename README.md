# steps for kyma customer subaccount deletion
1. Run the job :https://gkerefappscicd.jaas-gcp.cloud.sap.corp/job/kyma_customer_subaccount_deletion/
> Note: Kindly update the build parameters as per your requirement.


> Note : Make sure you first delete the customer subaccount and proceed for deleting provider subacconut


# steps for kyma provider subaccount deletion
1. Run the job https://gkerefappscicd.jaas-gcp.cloud.sap.corp/job/kyma_provider_subaccount_deletion/
> Note: Kindly update the build parameters as per your requirement.
> Note: Kindly observe on “Delete Kyma-instances and apps“ stage ,if required login to kyma authentication with username/password on [Node](https://gkerefappscicd.jaas-gcp.cloud.sap.corp/computer/windowskymanode/)

