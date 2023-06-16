FROM ghcr.io/dergeberl/multitool-kubectl:v0.7

MAINTAINER dergeberl

LABEL org.opencontainers.image.source https://github.com/dergeberl/kubeteach-webterminal

RUN wget https://github.com/sorenisanerd/gotty/releases/download/v1.5.0/gotty_v1.5.0_linux_amd64.tar.gz && \
    tar xfz gotty_v1.5.0_linux_amd64.tar.gz && \
    rm gotty_v1.5.0_linux_amd64.tar.gz


RUN useradd -u 65531 -m kubeteach

RUN echo "alias k=kubectl" >> /home/kubeteach/.bash_aliases && \
    echo 'source <(kubectl completion bash)' >>~/.bashrc


USER 65531
WORKDIR /home/kubeteach

ENTRYPOINT ["/gotty", "-w", "/bin/bash"]
