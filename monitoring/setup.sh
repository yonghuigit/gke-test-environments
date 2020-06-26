#!/bin/sh
echo "Cleaning up"
helm uninstall prometheus 
helm uninstall grafana
echo "Installing"
helm install prometheus stable/prometheus -f prometheus_values.yaml
helm install grafana stable/grafana -f grafana_values.yaml
kubectl apply -f gke-managed-certs.yaml
kubectl apply -f gke-monitor-ingress.yaml
