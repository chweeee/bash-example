#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -e

EXIT_CODE=0

cat << EOF
steps:
  - label: "Example Test"
    command: 
      - echo "Hello World!"

  - wait

  - label: "dummy step 1"
    command: echo ${BUILDKITE_BRANCH}

  - wait

  - label: "dummy step 2"
    command:
       - exit -1
 
  - wait: ~
    continue_on_failure: true

  - trigger: "soft-tofu-stew"
    label: ":package: rebuilding master"
    if: ${BUILDKITE_LAST_HOOK_EXIT_STATUS} != 0
    build:
      branch: "master"
      commit: "HEAD"

  - label: "dummy step 3"
    command: echo "Dummmy 3"

EOF
