# Docker GitLab Runner
A Dockerized GitLab Runner that automatically registers with the GitLab CI Server

## Dependencies
This version of GitLab Runner requires

 * Docker
 
## Installation
The Docker image can be run directly from Docker Hub

    docker run --detached \
        --name=gitlab-runner
        --restart=always \
        --environment REGISTRATION_TOKEN=XXXXXXXXXX \
        --environment CI_SERVER_URL=http://gitlab.mydomain.com \
        --environment RUNNER_EXECUTOR=shell \
        --environment RUNNER_SHELL=bash \
        --volume=/etc/gitlab-runner:/etc/gitlab-runner
        
## License

Please see LICENSE

## Acknowledgements

This GitLab Runner was derived from GitLab's Runner container.

 * [GitLab Runner](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/)