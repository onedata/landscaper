FROM alpine:3.6

RUN echo '@edge https://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community https://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk upgrade --update && \
    apk add bash curl ca-certificates

ENV HELM_VERSION="v2.5.0"
ENV K8S_VERSION="v1.7.0"

RUN curl -s https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xz -C /tmp && mv /tmp/linux-amd64/helm /usr/bin

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/bin

RUN helm init --client-only && \
    mkdir -v -p /root/.kube

CMD bash

WORKDIR /root
