FROM alpine:3.6

LABEL MAINTAINER="Sergii Nuzhdin <ipaq.lw@gmail.com@gmail.com>"

ENV KUBE_LATEST_VERSION="v1.17.0"

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && apk add --update gettext openssl bash\
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && url https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && apk del --purge deps \
    && rm /var/cache/apk/*
