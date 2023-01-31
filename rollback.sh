# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export SERVICE_NAME=cloud-run-canary
export ARTIFACT_REGISTRY_NAME=cloud-run-source-deploy
export REGION=europe-west4
export SERVICE_ACCOUNT_EMAIL=landing-zone-demo-341118@appspot.gserviceaccount.com

# if a rollback is needed to the original revision
gcloud run services update-traffic $SERVICE_NAME \
--to-revisions cloud-run-canary-00001-hej=100  \
--region=$REGION \

# Another option to perform a rollback is to send 0% traffic to the tagged revision
# gcloud run services update-traffic $SERVICE_NAME \
# --to-tags green=0  \
# --region=$REGION \