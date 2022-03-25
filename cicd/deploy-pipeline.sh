#!/bin/bash
gcloud deploy apply --file cicd/clouddeploy.yaml --region asia-east1
gcloud beta builds triggers create github \
    --name=hello-demo \
    --repo-name=hello-demo \
    --repo-owner=shawnho1018 \
    --branch-pattern="^main$" \
    --build-config=cicd/cloudbuild.yaml \
    --require-approval

