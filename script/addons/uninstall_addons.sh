#!/usr/bin/env bash
# Argument 3 is config
if [[ $# -eq 3 ]]; then
  ./script/addons/check_addons_exist.py -m "$2" -c "$3"
else
  ./script/addons/check_addons_exist.py -m "$2"
fi
retVal=$?
if [[ $retVal -ne 0 ]]; then
  echo "Error check_addons_exist.py into uninstall_addons.sh"
  exit 1
fi
if [[ $# -eq 3 ]]; then
  ./run.sh --no-http --stop-after-init -d "$1" --uninstall "$2" "$3"
else
  ./run.sh --no-http --stop-after-init -d "$1" --uninstall "$2"
fi
