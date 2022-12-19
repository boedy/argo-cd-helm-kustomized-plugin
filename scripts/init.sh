#!/bin/sh
HOME=/tmp

# If Chart exist
if [ -f ../../base/Chart.yaml ]; then
  helm dependency build ../../base
  # Create default values files if they dont exist
  touch ../../base/values.yaml
  touch values.yaml
fi
