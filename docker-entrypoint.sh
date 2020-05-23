#!/bin/sh
set -e

ndcd_setup.sh

echo "################################################"
echo "# Configuration used: /.ndc/ndc.conf  #"
echo "################################################"
echo ""
cat /.ndc/ndc.conf
echo ""
echo "################################################"

exec ndcd -datadir=/.ndc -conf=/.ndc/ndc.conf -printtoconsole "$@"
