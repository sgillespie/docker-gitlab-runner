FROM ubuntu
MAINTAINER Sean Gillespie <sean@mistersg.net>

# Install curl
RUN apt-get update && apt-get install -y curl

# Add official gitlab repositories to APT
RUN curl \
     -L "https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh" \
     | bash

# Install gitlab-runner
RUN apt-get install -y gitlab-ci-multi-runner

VOLUME /etc/gitlab-runner /home/gitlab

# Add the entrypoint
ADD assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["run", "--working-directory=/home/gitlab-runner", "--user=gitlab-runner"]
