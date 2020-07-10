#!/bin/bash

set -o errexit
set -o nounset

usage(){
  cat <<EOF
Usage: $0 [RESOURCE]...

Examples:
  $0 services deployment
EOF
}

case ${1:-""} in
  "-h"|"--help")
    usage
    exit 0
    ;;
  "")
    echo "err: empty RESOURCE list"
    exit 1
    ;;
esac
RESOURCES=${@:-""}

for resource in $RESOURCES; do
  for filepath in $resource/*; do
    echo " - "$filepath
    kubectl apply -f $filepath
  done
done

exit 0
