# cmsDriver command
cmsDriver.py  \
--python_filename MakeDIGI_cfg.py \
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
-n 100 \
--fileout file:GENSIMDIGIRAW.root
#--filein /store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085_411.root \
