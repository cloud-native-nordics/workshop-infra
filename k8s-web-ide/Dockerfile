FROM codercom/code-server
# Install needed utilities, e.g. Git is essential for the IDE
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        nano \
        docker.io \
        bsdtar && \
    apt-get clean

# Install kubectl
ENV K8S_VERSION=v1.14.0
RUN curl -sSL https://dl.k8s.io/release/${K8S_VERSION}/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Install helm
ENV HELM_HOME=/root/.helm
RUN curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash && \
    helm init -c

# Workaround bugs in code-server
RUN mkdir -p \
        /root/.local/share/code-server/Backups \
        /root/.local/share/code-server/User/workspaceStorage \
        /root/.local/share/code-server/extensions && \
    touch /root/.local/share/code-server/Backups/workspaces.json

# Install extensions
COPY install-ext.sh /
RUN /install-ext.sh redhat vscode-yaml 0.3.0 && \
    /install-ext.sh ms-kubernetes-tools vscode-kubernetes-tools 0.1.18 && \
    /install-ext.sh PeterJausovec vscode-docker 0.6.1

# Clone the actual source to be displayed
RUN git clone https://github.com/cloud-native-nordics/workshop-infra /root/project/code-server

# By default run behind a Let's Encrypt proxy
CMD ["code-server", "--allow-http", "--no-auth"]
