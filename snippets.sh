#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
  exit
fi

cd "$(dirname "$0")"

main() {
  local WHAT=$(grep -Ev '(^#|^$)' ~/bookmarks.txt | dmenu -i -l 20 -p ' >> ' -nb '#282828' -nf '#989898' -sf '#282828' -sb '#989898')
  xdotool type --delay 5 "$WHAT"
}

main "$@"

