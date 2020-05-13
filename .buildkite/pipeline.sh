#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

EXIT_CODE=0

cat << EOF
steps:
  - label: "Example Test"
    command: echo "Hello World!"

  - wait

  - label: "dummy step 1"
    command: echo ${BUILDKITE_BRANCH}

  - wait

  - label: "dummy step 2"
    command: 
      - echo -1
      - if [ $? -ne 0 ]; then EXIT_CODE=1; fi
      - exit ${EXIT_CODE}

  - wait
  
  - trigger: "soft-tofu-stew"
    label: ":package: rebuilding master"
    build:
      branch: "master"
      commit: "HEAD"

  - label: "dummy step 3"
    command: echo "Dummmy 3"

EOF
