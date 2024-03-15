# Kubernetes


### Install kubectl

Best place to start is to install kubernetes [cli](https://kubernetes.io/docs/tasks/tools/)<br>
Verify installation `kubectl --version`
<br><br>

##### Using existing Kubernetes

Make sure you are logged with the relating cli and run:

GCP: `gcloud auth login`<br>
AWS: `aws eks --region <region-code> update-kubeconfig --name <cluster>`<br>
Azure: `az aks install-cli && az aks get-credentials --resource-group <rg> --name <cluster>`<br>
Local: `kubectl config set-context <context>`
<br><br>

##### Using local k8s development environent

There are a few local k8s clusters you can install on your computer for testing purposes.
These are useful when developing or testing k8s applications and infrastructure. Installation should automatically add local context for kubectl:

- [Kind](https://kind.sigs.k8s.io/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)

<sup>No need to install full-scale k8s<sup>
<br><br>

## Verify login

You should be able to see which kubernetes you are now logged in:

```
# List all contexts
kubectl config get-contexts

# Show current context (this is active user&cluster you are logged in)
kubectl config current-context

# List all users
kubectl config get-users

# List all clusters
kubectl config get-clusters
```

If you are not logged in with correct context you can change easily you login information:
```
# Change context
kubectl config use-context <context>

# Add user
kubectl config set-context <context>

# Add cluster
kubectl config use-context <context>

# Add context
kubectl config set-context <name> --cluster=<cluster> --user=<user>

```

You can also check how kubectl saves your logins:
```
echo $KUBECONFIG # default value is ~/.kube

ls $KUBECONFIG
```