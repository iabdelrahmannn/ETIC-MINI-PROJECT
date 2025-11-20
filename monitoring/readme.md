Complete end-to-end DevOps implementation for a Python microservice using:
Docker – Kubernetes – Terraform – Azure DevOps – Prometheus – Grafana

🧩 1. Project Structure
project/
│
├── app/                          # Microservice code
├── run.py                        # Application entry point
├── requirements.txt              # Python dependencies
├── Dockerfile                    # Docker container instructions
│
├── k8s/                          
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml (optional)
│
├── terraform/                    # Infrastructure as Code (AKS)
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
│
├── .azure-pipelines.yml          # Azure DevOps pipeline
│
└── monitoring/README.md          # Monitoring stack documentation

🧱 2. Clone Repository
git clone https://github.com/iabdelrahmannn/ETIC-MINI-PROJECT.git


🐳 3. Dockerization
Build Docker Image
docker build -t etic-app:v1 .

Run Container
docker run --rm -p 5000:5000 etic-app:v1

Test Application

Open:

http://localhost:5000

☸️ 4. Kubernetes Deployment
create deployment and service yaml files
Apply Deployment & Service
Apply all manifests:
kubectl apply -f k8s/

Check running pods:
kubectl get pods

Check service:
kubectl get svc


If using a cloud cluster (AKS/EKS/GKE) → an external LoadBalancer IP will appear.

🌩 5. Terraform – Azure Kubernetes Service (AKS)

Navigate to Terraform folder:

cd terraform
create main ,provider,variables & outputs tf files
Initialize Terraform
terraform init

Validate configuration
terraform validate

Plan deployment
terraform plan

Apply deployment
terraform apply tfplan

Connect kubectl to AKS
az aks get-credentials --resource-group <rg-name> --name <aks-name>

Check cluster nodes
kubectl get nodes


⚠️ Requires an active Azure subscription ( which i don't have currently)
(Terraform code is ready even if not applied)

🔄 6. CI/CD Pipeline – Azure DevOps
1. Create Pipeline

Azure DevOps → Pipelines → New Pipeline → GitHub → Existing YAML → .azure-pipelines.yml

2. Create Service Connections
Docker registry

Azure DevOps → Project Settings → Service Connections → New → Docker Registry
Name it:

docker-connection


⚙️ 7. Azure DevOps Pipeline Stages
Trigger on main branch:
trigger:
- main

Build & Push Docker Image

(Already included in .azure-pipelines.yml)

Deployment

Kubernetes deploy stage is prepared but disabled until a real cluster exists.

📊 8. Monitoring – Prometheus & Grafana

Navigate to monitoring folder:

cd monitoring

Add Helm Repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

Create monitoring namespace
kubectl create namespace monitoring

Install monitoring stack
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring

Check monitoring pods
kubectl get pods -n monitoring

Forward Grafana port
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80

Access Grafana

Open:

http://localhost:3000


Default credentials:

admin
prom-operator

🧽 9. Cleanup (Optional)
Remove monitoring stack
helm uninstall monitoring -n monitoring
kubectl delete namespace monitoring

Remove Kubernetes resources
kubectl delete -f k8s/

Destroy AKS via Terraform
terraform destroy

🎯 10. Summary

✔ Microservice containerized with Docker
✔ Kubernetes manifests for deployment & service
✔ Terraform IaC for AKS
✔ Azure DevOps CI/CD pipeline (Build + Push + Deploy ready)
✔ Full monitoring stack (Prometheus + Grafana)
✔ Complete documentation
