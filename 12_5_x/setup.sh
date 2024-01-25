#!/bin/bash

# GEN Script begin
rm -f request_fragment_check.py
wget -q https://raw.githubusercontent.com/cms-sw/genproductions/master/bin/utils/request_fragment_check.py
chmod +x request_fragment_check.py
./request_fragment_check.py --bypass_status --prepid TSG-Phase2Fall22GS-00122

export SCRAM_ARCH=el8_amd64_gcc10

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_12_5_2_patch1/src ] ; then
  echo release CMSSW_12_5_2_patch1 already exists
else
  scram p CMSSW CMSSW_12_5_2_patch1
fi
cd CMSSW_12_5_2_patch1/src
cmsenv
eval `scram runtime -sh`

# Download fragment from McM
curl -s -k https://cms-pdmv-prod.web.cern.ch/mcm/public/restapi/requests/get_fragment/TSG-Phase2Fall22GS-00122 --retry 3 --create-dirs -o Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py
[ -s Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py ] || exit $?;

# Check if fragment contais gridpack path ant that it is in cvmfs
if grep -q "gridpacks" Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py; then
  if ! grep -q "/cvmfs/cms.cern.ch/phys_generator/gridpacks" Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py; then
    echo "Gridpack inside fragment is not in cvmfs."
    exit -1
  fi
fi

scram b
cd ../..
