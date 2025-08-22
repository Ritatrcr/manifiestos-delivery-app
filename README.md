# Dependencias y lock
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm dependency update charts/pedido-app

# Namespaces + Secret
kubectl create ns pedido-dev
kubectl -n pedido-dev create secret generic bd-secret \
  --from-literal=POSTGRES_PASSWORD='TuPassSegura'

# Instalar DEV
helm upgrade --install pedido-app charts/pedido-app \
  -n pedido-dev -f charts/pedido-app/values-dev.yaml

# Verificar
kubectl -n pedido-dev get pods,svc,ingress
