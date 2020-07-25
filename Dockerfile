FROM alpine:latest

ARG CDKTF_VERSION
ARG TF_VERSION

LABEL author="Denis Silva"
LABEL maintainer="https://github.com/denstorti"
LABEL name="cdktf-cli"
LABEL version=${CDKTF_VERSION}

RUN apk add --no-cache \
			npm \
			curl \
		&& npm install --global cdktf-cli@${CDKTF_VERSION} 

RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
	&& unzip -o terraform.zip \
	&& rm terraform.zip \
	&& mv terraform /usr/local/bin/

CMD [ "cdktf" ]