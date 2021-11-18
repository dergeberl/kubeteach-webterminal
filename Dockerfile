FROM ubuntu

RUN apt update && apt install -y curl vim wget && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg --output /etc/apt/trusted.gpg.d/k8s-apt-key.gpg && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    apt update && apt install -y kubectl &&  \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN wget https://github.com/sorenisanerd/gotty/releases/download/v1.3.0/gotty_v1.3.0_linux_amd64.tar.gz && \
    tar xfz gotty_v1.3.0_linux_amd64.tar.gz && \
    rm gotty_v1.3.0_linux_amd64.tar.gz


RUN useradd -m kubeteach

RUN echo "alias k=kubectl" >> /home/kubeteach/.bash_aliases

USER kubeteach
WORKDIR /home/kubeteach

ENTRYPOINT ["/gotty", "-w", "/bin/bash"]
