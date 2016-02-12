FROM alpine
MAINTAINER Sean Gillespie <sean@mistersg.net>

RUN apk update && apk add openssl

RUN ["wget", \
     "-O", "/usr/local/bin/gitlab-ci-multi-runner", \
     "https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-386"]
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner

RUN ["adduser", \
     "-h", "/home/gitlab-runner", \
     "-s", "/bin/sh", \
     "-D", \
     "gitlab-runner"]

VOLUME ["/etc/gitlab-runner"]
