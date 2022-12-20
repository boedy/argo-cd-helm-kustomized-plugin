FROM alpine:3

RUN wget https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz -O - | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm  \
    && chmod +x /usr/local/bin/helm

RUN wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.5.7/kustomize_v4.5.7_linux_amd64.tar.gz \
      -O - | tar xz  \
    && mv kustomize /usr/local/bin/kustomize  \
    && chmod +x /usr/local/bin/kustomize

RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
    -O /usr/local/bin/jq && chmod +x /usr/local/bin/jq

RUN wget https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_amd64 \
    -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq

