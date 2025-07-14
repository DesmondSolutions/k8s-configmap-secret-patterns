# Kubernetes: ConfigMap and Secret Consumption Patterns

This documentation explores the **three primary ways** Kubernetes Pods can consume `ConfigMaps` and `Secrets`:

1. **As Environment Variables**
2. **As Command-Line Arguments**
3. **As Mounted Files (Volumes)**

It includes practical YAML examples, comparisons of each approach, and discusses **security and use-case suitability**.

---

## 🗂️ Prerequisites

- A running Kubernetes cluster (e.g., Minikube, EKS)
- `kubectl` CLI installed and configured
- Basic knowledge of YAML, Kubernetes Pods, and containers

---

## 🔧 Step 1: Define a ConfigMap and a Secret

### `configmap.yaml`
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_MODE: "production"
  APP_PORT: "8080"
