# cloud-run-canary
 Canary deployment of Cloud Run service.

## How to Canary deploy a Cloud Run service
1. Canary deployment is implemented using [revision tags](https://cloud.google.com/run/docs/configuring/tags).
2. Deploy the initial service using deploy.sh.
3. Using canary-deploy.sh, deploy the “test” service with 0% traffic. Tag is with “test”.
4. Send % of traffic to the “test” version, increase/decrease % of traffic as needed.
5. If a rollback is needed, assign 0% traffic to the “test” version. (see rollback.sh)


