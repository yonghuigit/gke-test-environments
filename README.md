# gke-test-environments
git clone https://github.com/yonghuigit/gke-test-environments.git
cd gke-test-environments/monitoring
gcloud compute addresses create monitor-load-balancer-static-ip --global
gcloud compute addresses describe monitor-load-balancer-static-ip --global

# dns setup
# prometheus.itradenetwork.net
# grafana.itradenetwork.net
./setup.sh
kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo



