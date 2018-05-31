::dcos marathon app add metrics_prometheus.json
::dcos marathon app add metrics_grafana.json
dcos marathon pod add metrics.json
dcos marathon app add grafana.json
dcos marathon pod add prometheus.json