#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

cat << EOF
steps:
  - label: "Example Test"
    command: echo "Hello World!"
  - label: "dummy step 1"
    command: echo "Dummy 1"
  - label: "dummy step 2"
    command: echo "Dummy 2"
  - label: "dummy step 3"
    command: echo "Dummy 3"

EOF
