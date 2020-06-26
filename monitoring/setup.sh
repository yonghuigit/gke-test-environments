#!/bin/sh
echo "Cleaning up"
kubectl delete -f gke-monitor-ingress.yaml
kubectl delete -f gke-managed-certs.yaml
helm uninstall prometheus 
helm uninstall grafana
echo "Installing"
helm install prometheus stable/prometheus -f prometheus_values.yaml
helm install grafana stable/grafana -f grafana_values.yaml
kubectl apply -f gke-managed-certs.yaml
kubectl apply -f gke-monitor-ingress.yaml
