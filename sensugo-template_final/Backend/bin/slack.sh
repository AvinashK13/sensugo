cat << EOF | sensuctl create 

---
api_version: core/v2
type: Handler
metadata:
  namespace: default
  name: slack
spec:
  type: pipe
  #change channel name 
  command: sensu-slack-handler --channel '$SLACK_CHANNEL'
  #timeout: 10
  env_vars: 
    #change this as per slack channel workspace
  - SLACK_WEBHOOK_URL=$SLACK_URL 
  runtime_assets:
  - sensu-slack-handler
EOF
