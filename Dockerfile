FROM alpine
MAINTAINER Sean Gillespie <sean@mistersg.net>

RUN apk update && apk add openssl bash

RUN wget \
     -O /usr/local/bin/gitlab-ci-multi-runner \
     "https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-386"
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner

RUN adduser \
     -h /home/gitlab-runner \
     -s /bin/bash \
     -D \
     gitlab-runner
VOLUME /etc/gitlab-runner /home/gitlab

ADD assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
