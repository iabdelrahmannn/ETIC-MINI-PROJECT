1. Prerequisites

Before deploying the monitoring stack, ensure you have:

✔ Kubernetes Cluster
✔ kubectl installed
✔ Helm installed

Verify:
kubectl version --client
kubectl get nodes

helm version


2. Add Helm Repository

The monitoring stack comes from the official Prometheus community repository.

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

3. Create Monitoring Namespace

kubectl create namespace monitoring


validate:

kubectl get ns

4. Install kube-prometheus-stack

Install: Prometheus Alertmanager Grafana

use pre-build dashboard

command : helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring


5. Validate Deployment

Check Pods:

kubectl get pods -n monitoring


Check Services:

kubectl get svc -n monitoring

6. Access Grafana Dashboard

Expose Grafana locally:

kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80


Then open in the browser:

http://localhost:3000

After login: Go to Dashboards → Browse



7. Prometheus UI

Expose Prometheus dashboard:

kubectl port-forward svc/monitoring-kube-prometheus-prometheus -n monitoring 9090


Open:

👉 http://localhost:9090

You can query metrics here.

8. Alertmanager UI (Optional)

Expose Alertmanager:

kubectl port-forward svc/monitoring-kube-prometheus-alertmanager -n monitoring 9093


Open:

http://localhost:9093
