#!/bin/sh
HOME=/tmp

if grep -q "\- \"Chart.yaml\"" ../../base/kustomization.yaml; then

  BASE_NAMESPACE=$(cat ../../base/kustomization.yaml | yq e '.namespace // "default"' -)
  NAMESPACE=$(cat kustomization.yaml | yq e ".namespace // \"$BASE_NAMESPACE\"" -)

  helm template \
    --release-name ${ARGOCD_APP_NAME} \
    --include-crds \
    --namespace $NAMESPACE \
    ../../base \
    -f ../../base/values.yaml \
    -f values.yaml > ../../base/compiled-chart.yaml

  # update kustomizion to include compiled helm chart
  sed -i 's/Chart.yaml/compiled-chart.yaml/g' ../../base/kustomization.yaml
fi

kustomize build
