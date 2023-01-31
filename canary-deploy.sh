# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export SERVICE_NAME=cloud-run-canary
export ARTIFACT_REGISTRY_NAME=cloud-run-source-deploy
export REGION=europe-west4
export SERVICE_ACCOUNT_EMAIL=landing-zone-demo-341118@appspot.gserviceaccount.com

# Create a revision tags and send a % of traffic to the tag
gcloud run services update-traffic $SERVICE_NAME \
--to-tags green=10  \
--region=$REGION \