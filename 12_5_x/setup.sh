#!/bin/bash

# GEN Script begin
rm -f request_fragment_check.py
wget -q https://raw.githubusercontent.com/cms-sw/genproductions/master/bin/utils/request_fragment_check.py
chmod +x request_fragment_check.py
./request_fragment_check.py --bypass_status --prepid TSG-Phase2Fall22GS-00221
GEN_ERR=$?
if [ $GEN_ERR -ne 0 ]; then
  echo "GEN Checking Script returned exit code $GEN_ERR which means there are $GEN_ERR errors"
  echo "Validation WILL NOT RUN"
  echo "Please correct errors in the request and run validation again"
  exit $GEN_ERR
fi
echo "Running VALIDATION. GEN Request Checking Script returned no errors"
# GEN Script end

# Download fragment from McM
curl -s -k https://cms-pdmv-prod.web.cern.ch/mcm/public/restapi/requests/get_fragment/TSG-Phase2Fall22GS-00221 --retry 3 --create-dirs -o Configuration/GenProduction/python/TSG-Phase2Fall22GS-00221-fragment.py
[ -s Configuration/GenProduction/python/TSG-Phase2Fall22GS-00221-fragment.py ] || exit $?;

# Check if fragment contais gridpack path ant that it is in cvmfs
if grep -q "gridpacks" Configuration/GenProduction/python/TSG-Phase2Fall22GS-00221-fragment.py; then
  if ! grep -q "/cvmfs/cms.cern.ch/phys_generator/gridpacks" Configuration/GenProduction/python/TSG-Phase2Fall22GS-00221-fragment.py; then
    echo "Gridpack inside fragment is not in cvmfs."
    exit -1
  fi
fi

