#!/bin/bash
cat << EOF | sensuctl create 
---
api_version: core/v2
type: Handler
metadata:
  namespace: default
  name: email
spec:
  type: pipe
  command: sensu-email-handler -f $EMAIL_SENDER  -t $EMAIL_RECEIPIENT  -s $EMAIL_SMTP_SERVER -P 25 -u $EMAIL_USERNAME -p $EMAIL_PASSWORD  -T /etc/sensu/email_template
  filters:
  - is_incident
  - not_silenced
  - state_change_only
  - fatigue_check
  runtime_assets:
  - email-handler
EOF
