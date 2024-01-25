#!/bin/bash

theConfig="MakeDIGI_cfg.py"
nEvents=5
rm -f $theConfig


# cmsDriver command
cmsDriver.py  \
--python_filename $theConfig \
--eventcontent FEVTDEBUGHLT \
--pileup 'AVE_200_BX_25ns' \
--customise SLHCUpgradeSimulations/Configuration/aging.customise_aging_1000,Configuration/DataProcessing/Utils.addMonitoring \
--datatier GEN-SIM-DIGI-RAW \
--pileup_input "dbs:/MinBias_TuneCP5_14TeV-pythia8/Phase2Fall22GS-HCalDetIDFix_125X_mcRun4_realistic_v2-v1/GEN-SIM" \
--conditions 125X_mcRun4_realistic_v2 \
--step DIGI:pdigi_valid,L1TrackTrigger,L1,DIGI2RAW,HLT:@fake2 \
--geometry Extended2026D88 \
--nStreams 3 \
--filein file:GS.root \
--era Phase2C17I13M9 \
--no_exec \
--mc \
-n $nEvents \
--fileout file:GENSIMDIGIRAW.root
#--filein /store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085_411.root \

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
