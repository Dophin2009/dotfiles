#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

MULLVAD_STATUS=$(mullvad status)

if echo $MULLVAD_STATUS | grep -q 'Connected'; then
  echo ""
 elif echo $MULLVAD_STATUS | grep -q 'Connecting'; then
   echo ""
 else
  echo ""
fi
