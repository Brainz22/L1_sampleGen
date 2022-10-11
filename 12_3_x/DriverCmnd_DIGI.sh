#Taken from another MCM example
#cmsDriver.py step1 \
#--fileout file:TSG-PhaseIISpring22DRMiniAOD-00060_step1.root \
#--pileup_input "dbs:/MinBias_TuneCP5_14TeV-pythia8/PhaseIISpring22GS-123X_mcRun4_realistic_v11-v1/GEN-SIM" \ 
#--mc \
#--eventcontent FEVTDEBUGHLT \
#--pileup 'AVE_200_BX_25ns' \
#--customise SLHCUpgradeSimulations/Configuration/aging.customise_aging_1000 \
#--datatier GEN-SIM-DIGI-RAW \
#--conditions 123X_mcRun4_realistic_v11 \
#--step DIGI:pdigi_valid,L1TrackTrigger,L1,DIGI2RAW,HLT:@fake2 \
#--nThreads 8 \
#--geometry Extended2026D88 \
#--nStreams 3 \
#--era Phase2C17I13M9
#-n 100



# cmsDriver command
# 
cmsDriver.py  \
--python_filename TSG-Phase2HLTTDRSpring22DIGI-00085_test_cfg.py \
--eventcontent FEVTDEBUGHLT \
--pileup 'AVE_140_BX_25ns,{"B":(-3,3)}' \
--customise SLHCUpgradeSimulations/Configuration/aging.customise_aging_1000 \
--datatier GEN-SIM-DIGI-RAW \
--fileout file:TSG-Phase2HLTTDRSpring22DIGI-00085.root \
--pileup_input "dbs:/MinBias_TuneCP5_14TeV-pythia8/PhaseIISpring22GS-123X_mcRun4_realistic_v11-v1/GEN-SIM" \
--conditions 123X_mcRun4_realistic_v11 \
--step DIGI:pdigi_valid,L1,L1TrackTrigger,DIGI2RAW,HLT:@fake2 \
--geometry Extended2026D88 \
--era Phase2C17I13M9 \
--filein /store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085_411.root \
--no_exec \
--mc \
-n 100
# || exit $? ;
#--filein file:TSG-Phase2HLTTDRWinter20GS-00085.root \
#--filein /store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085_411.root \
### edits based on above snippet
#--customise SLHCUpgradeSimulations/Configuration/aging.customise_aging_1000,SimGeneral/MixingModule/customiseStoredTPConfig.higherPtTP,Configuration/DataProcessing/Utils.addMonitoring \
#--era Phase2C9 \
