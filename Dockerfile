FROM alpine:3.11.6

ARG PACKER_VERSION=1.6.0
ARG ANSIBLE_VERSION=2.9.7-r0

RUN apk update &&\ 
  apk --no-cache add jq bash git ca-certificates openssh-client sed openssl ansible=${ANSIBLE_VERSION} &&\
  wget -O /tmp/packer.zip \
    "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" &&\
  unzip -o /tmp/packer.zip -d /usr/local/bin &&\
  rm -f /tmp/packer.zip &&\
  apk --no-network del openssl