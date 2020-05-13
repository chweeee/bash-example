#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
# set -eu

EXIT_CODE=0

cat << EOF
steps:
  - label: "Example Test"
    command: 
      - echo "Hello World!"

  - wait

  - label: "dummy step 2"
    command:
       - env
       - exit -1
       - EXIT_CODE=$?

  - wait: ~
    continue_on_failure: true

  - trigger: "soft-tofu-stew"
    label: ":package: rebuilding master"
    build:
      branch: "master"
      commit: "HEAD"

  - label: "dummy step 3"
    command: echo "Dummmy 3"

EOF
