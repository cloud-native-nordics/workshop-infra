FROM codercom/code-server
# Install needed utilities, e.g. Git is essential for the IDE
RUN apt-get update && \
    apt-get install -y git curl nano docker.io && \
    apt-get clean

# Install kubectl
ENV K8S_VERSION=v1.13.0
RUN curl -sSL https://dl.k8s.io/release/${K8S_VERSION}/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Install helm
ENV HELM_HOME=/root/.helm
RUN curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash && \
    helm init -c

# Workaround bugs in code-server
RUN mkdir -p /root/.local/share/code-server/Backups /root/.local/share/code-server/User/workspaceStorage && \
    touch /root/.local/share/code-server/Backups/workspaces.json

# TODO: Install VS Code plugins
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-kubernetes-tools/vsextensions/vscode-kubernetes-tools/0.1.18/vspackage
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/PeterJausovec/vsextensions/vscode-docker/0.6.1/vspackage 
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/redhat/vsextensions/vscode-yaml/0.3.0/vspackage
RUN git clone https://github.com/cloud-native-nordics/workshop-infra /root/project/code-server

# By default run behind a Let's Encrypt proxy
CMD ["code-server", "--allow-http", "--no-auth"]
