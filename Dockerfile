FROM alpine:latest
LABEL name="terraform"
LABEL version=0.11.3
LABEL maintainer="Avvo Infrastructure Team <infrastructure@avvo.com>"
ENV TERRAFORM_VERSION=0.11.3
VOLUME ["/data"]
WORKDIR /data
RUN apk --update --no-cache add ca-certificates openssl sudo git \
	&& wget -O terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
	&& unzip terraform.zip -d /usr/local/bin \
	&& rm -rf terraform.zip /var/cache/apk/*
CMD ["/usr/local/bin/terraform", "--help"]
