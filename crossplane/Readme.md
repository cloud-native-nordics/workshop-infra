# Crossplane

Crossplane is a control plane framework which orchestrate your cloud environment. 
Crossplane needs a existing k8s installation in order to work so we can use one in the cloud or
install a local one.
<br><br>

## Prerequisites

1. Make sure you have logged in into a existing k8s before running these. For this folllow these [steps](../kubernetes/Readme.md).
2. Verify that [helm](https://helm.sh/docs/intro/install/) is installed 

## Install 

A full description from the steps can be found from [here](https://docs.crossplane.io/latest/software/install/)



```
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane

# Verify installation
kubectl get pods -n crossplane-system
```

