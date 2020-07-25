FROM alpine:latest

ARG VERSION

LABEL author="Denis Silva"
LABEL maintainer="https://github.com/denstorti"
LABEL name="cdktf-cli"
LABEL version=${VERSION}

RUN apk add --no-cache \
			npm>12.15.0-r1 \
		&& npm install --global cdktf-cli@${VERSION} 

CMD [ "cdktf" ]