#!/bin/bash

ENV_FILE="/opt/sensu/bin/env"
source  $ENV_FILE

################################
#sensuctl configure 
#################################
sensuctl configure -n   --username  $SENSU_BACKEND_CLUSTER_ADMIN_USERNAME   --password $SENSU_BACKEND_CLUSTER_ADMIN_PASSWORD   --namespace default  --url 'http://localhost:8080'

########################################
#plugins 
########################################
#echo "create asset for sensu-plugins-cpu-checks"
sensuctl asset add sensu-plugins/sensu-plugins-cpu-checks -r cpu

#echo "create asset for sensu-plugins-chrony"
sensuctl asset add jBRNDnl/sensu-plugins-chrony -r chrony

#echo "create asset for sensu-plugins-disk-checks"
sensuctl asset add sensu-plugins/sensu-plugins-disk-checks -r disk-checks

#echo "create asset for sensu-email-handler"
sensuctl asset add sensu/sensu-email-handler -r email-handler

#echo "create asset for sensu-plugins-filesystem-checks"
sensuctl asset add sensu-plugins/sensu-plugins-filesystem-checks -r file

#echo "create asset for sensu-plugins-plugins-http"
sensuctl asset add sensu-plugins/sensu-plugins-http -r http

#echo "create asset for sensu-plugins-influxdb-handler"
sensuctl asset add sensu/sensu-influxdb-handler -r influxdb-handler

#echo "create asset for sensu-plugins-load"
sensuctl asset add sensu-plugins/sensu-plugins-load-checks -r load

#echo "create asset for sensu-memory-checks"
sensuctl asset add sensu-plugins/sensu-plugins-memory-checks -r memory-checks

#echo "create asset for sensu-plugin-mongodb"
sensuctl asset add boutetnico/sensu-plugins-mongodb -r mongodb

#echo "create asset for sensu-monitoring-plugin"
sensuctl asset add sensu/monitoring-plugins -r monitoring

#echo "create asset for sensu-plugin-mysql"
sensuctl asset add boutetnico/sensu-plugins-mysql -r mysql

#echo "create asset for sensu-network-checks"
sensuctl asset add sensu-plugins/sensu-plugins-network-checks -r network-check

#echo "create asset for sensu-plugins-nginx"
sensuctl asset add sensu-plugins/sensu-plugins-nginx -r nginx

#echo "create asset for sensu-plugins-process"
sensuctl asset add sensu-plugins/sensu-plugins-process-checks -r process-checks

#echo "create asset for sensu-ruby-runtime"
sensuctl asset add sensu/sensu-ruby-runtime -r sensu-ruby-runtime

#echo "create asset for sensu-slack-handler"
sensuctl asset add sensu/sensu-slack-handler -r sensu-slack-handler

#echo "create asset for sensu-plugin-snmp"
sensuctl asset add sensu-plugins/sensu-plugins-snmp -r snmp

#echo "create asset for sensu-uptime-checks"
sensuctl asset add asachs01/sensu-go-uptime-check -r uptime



sensuctl asset add nixwiz/sensu-go-fatigue-check-filter --rename fatigue-check-filter

#influxdb
sensuctl create -f /opt/sensu/bin/influxdb.yml

#email
#sensuctl create -f /opt/sensu/bin/email.yml
bash /opt/sensu/bin/email.sh

#slack
#sensuctl create -f /opt/sensu/bin/slack.yml
bash /opt/sensu/bin/slack.sh

#event
sensuctl create -f /opt/sensu/bin/interval.yml


###################################
###checks and metrics 
###################################
#standard checks:
sensuctl create -f /opt/sensu/bin/standard-checks.yml

#standar metrics
sensuctl create -f /opt/sensu/bin/standard-metric.yml

#specific checks
sensuctl create -f /opt/sensu/bin/specific-checks.yml

#custom-checks
sensuctl create -f /opt/sensu/bin/custom-shell-checks.yml

#specific port for telved production
bash /opt/sensu/bin/port.sh

