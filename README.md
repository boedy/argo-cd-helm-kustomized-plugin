To include a helm chart in the application add a reference to the `Chart.yml` in the `resources` section.
When left out, the chart is ignored.

**Folder structure**

```
├── base
│   ├── Chart.yaml
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── values.yaml
└── overlays
    ├── production
    │   ├── kustomization.yaml
    │   └── values.yaml
    └── staging
        ├── kustomization.yaml
        └── values.yaml

```

**Example kustomize.yaml**

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: redis

resources:
  - "namespace.yaml"
  - "Chart.yaml"
```

Check the [Redis example](./examples/redis) how this would be configured.

## Quick Installation
You can clone this repo into your argo-cd bootstrap directory and include in as a component.

```yaml
# example argo-cd install with plugin
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: argocd

resources:
- https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
- namespace.yml

components:
  - argo-cd-helm-kustomize-plugin
```
