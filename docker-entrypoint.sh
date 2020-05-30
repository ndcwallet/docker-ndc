#!/bin/sh
set -e

ndcd_setup.sh

echo "################################################"
echo "# Configuration used: /.ndc/ndc.conf  #"
echo "################################################"
echo ""
cat /root/.ndc/ndc.conf
echo ""
echo "################################################"

sh ./ndcd -d -datadir=/root/.ndc -conf=/root/.ndc/ndc.conf 
