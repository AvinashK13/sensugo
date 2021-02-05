#!/bin/bash 

source /opt/sensu/bin/${CUSTOMER}.env 

for key in "${!PORTMAP[@]}"; do echo "Key: $key; Value: ${PORTMAP[$key]}"; 

cat << EOF | sensuctl create 
---
type: CheckConfig
api_version: core/v2
metadata:
  name: check-port-$key
  namespace: default
spec:
  command: check-ports.rb  -p ${PORTMAP[$key]}
  handlers: [email,slack]
  interval: 60
  publish: true
  runtime_assets:
  - network-check
  - sensu-ruby-runtime
  subscriptions:
  - port-$key
EOF
done 

