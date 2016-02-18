#!/bin/bash

gitlab-ci-multi-runner register --non-interactive && \
    gitlab-ci-multi-runner "$@"
