# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export SERVICE_NAME=cloud-run-canary
export ARTIFACT_REGISTRY_NAME=cloud-run-source-deploy
export REGION=europe-west4
export SERVICE_ACCOUNT_EMAIL=landing-zone-demo-341118@appspot.gserviceaccount.com

# Send 0% traffic to the tagged revision
gcloud run services update-traffic $SERVICE_NAME \
--to-tags test=0  \
--region=$REGION \

# if a rollback is needed to a specificrevision
# gcloud run services update-traffic $SERVICE_NAME \
# --to-revisions <Revision Name>=100  \
# --region=$REGION \

