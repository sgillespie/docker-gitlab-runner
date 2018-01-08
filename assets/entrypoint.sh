#!/bin/bash

gitlab-runner register --non-interactive && \
    gitlab-runner "$@"
