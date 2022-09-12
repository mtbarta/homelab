#!/bin/sh

VALUES="values-seed.yaml"

curl -fks --connect-timeout 5 https://git.deployql.net \
    || VALUES="values-seed.yaml"

echo $VALUES

helm template \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl apply -n argocd -f -
