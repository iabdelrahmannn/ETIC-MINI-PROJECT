# Monitoring Stack – Prometheus & Grafana

This document describes how to deploy a monitoring stack for the Kubernetes
cluster and the Python microservice using the `kube-prometheus-stack` Helm
chart (Prometheus + Alertmanager + Grafana).

--> The steps below assume that a Kubernetes cluster is already available (AKS / EKS / GKE / Minikube / Docker Desktop Kubernetes) and that 
`kubectl` and `helm` are installed and configured to talk to that cluster.



1. Prerequisites

- Running Kubernetes cluster (AKS / EKS / GKE / Minikube / Docker Desktop)
- `kubectl` configured (`kubectl get nodes` should work)
- `helm` installed
- A namespace dedicated to monitoring resources 

2. Add the Helm repository

The monitoring stack will be installed using the official
`prometheus-community` Helm charts.

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

3. Install kube-prometheus-stack

helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring


This will deploy: Prometheus Alertmanager Grafana

you can verify that the pods are running with:

kubectl get pods -n monitoring
kubectl get svc -n monitoring

4. Accessing Grafana

For local access:

kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80

Then open Grafana in the browser:
URL: http://localhost:3000

Browse the pre-built dashboards for Kubernetes nodes, pods and services OR Create custom dashboards for the microservice


5. Cluster & Application Metrics

Node CPU / memory / disk metrics
Pod and container resource usage
Kubernetes object metrics (deployments, replicasets, etc.)
