#!/bin/bash

theConfig="MakeGS_cfg-Test.py"
theFragment=TSG-Phase2Fall22GS-00122-fragment.py
nEvents=5
rm -f $theConfig

cmsDriver.py \
Configuration/GenProduction/python/${theFragment} \
--python_filename $theConfig \
--eventcontent RAWSIM \
--customise Configuration/DataProcessing/Utils.addMonitoring \
--datatier GEN-SIM \
--conditions 125X_mcRun4_realistic_v2 \
--beamspot HLLHC14TeV \
--customise_commands process.source.numberEventsInLuminosityBlock="cms.untracked.uint32(100)" \
--step GEN,SIM \
--nThreads 8 \
--geometry Extended2026D88 \
--era Phase2C17I13M9 \
--no_exec \
--mc \
-n $nEvents \
--fileout file:GS.root

# Add VarParsing
var_parsing_code="\nimport FWCore.ParameterSet.VarParsing as VarParsing\noptions = VarParsing.VarParsing('analysis')\noptions.maxEvents = 5\noptions.parseArguments()\n"

# Insert the VarParsing code after the first occurrence of 'import'
awk -v code="$var_parsing_code" '/import/ && !added { print; print code; added=1; next }1' $theConfig > temp && mv temp $theConfig

sed -i "s/input = cms.untracked.int32($nEvents)/input = cms.untracked.int32(options.maxEvents)/" $theConfig

# Add randomizer lines
echo -e "\n#Adding randomizer lines" >> $theConfig
echo "from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper" >> $theConfig
echo "randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)" >> $theConfig
echo "randSvc.populate()" >> $theConfig
