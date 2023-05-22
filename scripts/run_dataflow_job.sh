#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "#######Run the Dataflow Flex Template pipeline"

gcloud dataflow flex-template run "$JOB_NAME-$(date +%Y%m%d-%H%M%S)" \
  --template-file-gcs-location "$METADATA_TEMPLATE_FILE_PATH" \
  --project="$PROJECT_ID" \
  --region="$LOCATION" \
  --temp-location="$TEMP_LOCATION" \
  --staging-location="$STAGING_LOCATION" \
  --parameters service_account_email="$SA_EMAIL" \
  --parameters input_json_file="$INPUT_FILE" \
  --parameters team_league_dataset="$TEAM_LEAGUE_DATASET" \
  --parameters team_stats_table="$TEAM_STATS_TABLE"
