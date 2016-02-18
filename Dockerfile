FROM ubuntu
MAINTAINER Sean Gillespie <sean@mistersg.net>

# Install curl
RUN apt-get update && apt-get install -y curl

# Add official gitlab repositories to APT
RUN curl \
     -L "https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh" \
     | sudo bash

# Install gitlab-runner
RUN apt-get install -y gitlab-ci-multi-runner

# Add a gitlab user
RUN adduser \
     -h /home/gitlab-runner \
     -s /bin/bash \
     -D \
     gitlab-runner
VOLUME /etc/gitlab-runner /home/gitlab

# Add the entrypoint
ADD assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
