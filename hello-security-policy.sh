#!/bin/bash
gcloud compute security-policies create hello-security-policy \
    --description "policy for external users"

gcloud compute security-policies rules create 101 \
    --security-policy hello-security-policy     \
    --src-ip-ranges="*" \
    --action rate-based-ban                 \
    --src-ip-ranges="34.81.127.26/32"     \
    --action=throttle                \
    --rate-limit-threshold-count=30 \
    --rate-limit-threshold-interval-sec=60 \
    --conform-action=allow           \
    --exceed-action=deny-429         \
    --enforce-on-key=IP

gcloud compute security-policies rules create 1000 \
    --security-policy hello-security-policy \
    --description "Only allow GCP GCE 34.0.0.0/8" \
    --src-ip-ranges "34.0.0.0/8" \
    --action "allow"
gcloud compute security-policies rules update 2147483647 \
    --security-policy hello-security-policy \
    --action "deny-404"
