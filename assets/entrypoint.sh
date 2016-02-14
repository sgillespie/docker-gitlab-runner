#!/bin/sh

gitlab-ci-multi-runner register --non-interactive

if [[ "$?" = "0" ]]; then
    gitlab-ci-multi-runner run \
                           --user=gitlag-runner \
                           --working-directory=/home/gitlab-runner \
                           "$@"
fi
