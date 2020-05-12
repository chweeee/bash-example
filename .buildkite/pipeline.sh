#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

cat << EOF
steps:
  - label: "Example Test"
    command: echo "Hello World!"

EOF
