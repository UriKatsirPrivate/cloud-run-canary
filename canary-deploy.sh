# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export SERVICE_NAME=cloud-run-canary
export ARTIFACT_REGISTRY_NAME=cloud-run-source-deploy
export REGION=europe-west4
export SERVICE_ACCOUNT_EMAIL=landing-zone-demo-341118@appspot.gserviceaccount.com

# Artifact Registry
# gcloud builds submit --tag $REGION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/$ARTIFACT_REGISTRY_NAME/$SERVICE_NAME:latest

# Gradual rollout. This will work only once the servicce has atleast one deployed revision
# Create a revision tag
# gcloud run deploy $SERVICE_NAME \
# --image $REGION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/$ARTIFACT_REGISTRY_NAME/$SERVICE_NAME:latest \
# --platform managed \
# --allow-unauthenticated \
# --region=$REGION \
# --ingress=all \
# --min-instances=0 \
# --concurrency=20 \
# --service-account=$SERVICE_ACCOUNT_EMAIL \
# --execution-environment=gen2    \
# --no-traffic \
# --tag green \

# Send a % of traffic to the tag
gcloud run services update-traffic $SERVICE_NAME \
--to-tags green=50  \
--region=$REGION \