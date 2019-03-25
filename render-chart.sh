#!/bin/bash

if [[ $# < 1 || $# > 4 ]]; then
  echo "Usage: $0 CHART [VERSION]"
  exit 1
fi

mkdir -p charts manifests/generated .chart-cache

NAME=$1
VERSION=$2
NAMESPACE=${NAMESPACE:-"default"}

if [[ ${VERSION} != "" ]]; then
  VERSION="--version ${VERSION}"
fi

if [[ -f kustomize/${NAME}/namespace.txt ]]; then
  NAMESPACE=$(cat kustomize/${NAME}/namespace.txt)
fi
if [[ -f kustomize/${NAME}/values.yaml ]]; then
  VALUES="--values kustomize/${NAME}/values.yaml"
fi

if [[ ! -d .chart-cache/${NAME} ]]; then
  helm fetch \
    --repo https://kubernetes-charts.storage.googleapis.com \
    --untar \
    --untardir ./.chart-cache \
    ${VERSION} \
    ${NAME}
fi

helm template \
  ${VALUES} \
  --output-dir ./charts \
  -n "k8sfin" \
  --namespace ${NAMESPACE} \
  ./.chart-cache/${NAME}

if [[ -d kustomize/${NAME} ]]; then
  cp -r $(pwd)/kustomize/${NAME}/* $(pwd)/charts/${NAME}/
  kustomize build $(pwd)/charts/${NAME} > manifests/generated/${NAME}.yaml
  if [[ -f kustomize/${NAME}/postgen.sh ]]; then
    kustomize/${NAME}/postgen.sh $(pwd)/manifests/generated/${NAME}.yaml
  fi
fi
