#!/bin/bash 

cat << EOF | sensuctl create
---
type: CheckConfig
api_version: core/v2
metadata:
  name: check-out-of-memory
  namespace: default
spec:
  command: sh /var/cache/sensu/custom-checks/check-out-of-memory.sh 
  handlers: [email,slack]
  interval: 60
  publish: true
  runtime_assets:
  - network-check
  subscriptions:
  - outofmemory
EOF

