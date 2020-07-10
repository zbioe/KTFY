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

getResource(){
  resource=$1
  kubectl get $resource --no-headers -o custom-columns=NAME:.metadata.name ${@:2}
}

for resource in $RESOURCES; do
  mkdir -p $resource
  echo $resource
  for name in $(getResource $resource); do
    echo " - "$name 
    getResource $resource $name -o yaml > ${resource}/${name}.yml
  done
done

exit 0

