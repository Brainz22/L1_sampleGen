# cmsDriver command
# 
cmsDriver.py  \
--python_filename TSG-Phase2HLTTDRSpring22DIGI-00085_1_cfg.py \
--eventcontent FEVTDEBUGHLT \
--pileup 'AVE_140_BX_25ns,{"B":(-3,3)}' \
--customise SLHCUpgradeSimulations/Configuration/aging.customise_aging_1000,SimGeneral/MixingModule/customiseStoredTPConfig.higherPtTP,Configuration/DataProcessing/Utils.addMonitoring \
--datatier GEN-SIM-DIGI-RAW \
--fileout file:TSG-Phase2HLTTDRWinter20DIGI-00085.root \
--pileup_input "dbs:/MinBias_TuneCP5_14TeV-pythia8/Phase2Spring22GS-123X_mcRun4_realistic_v11-v1/GEN-SIM" \
--conditions 123X_mcRun4_realistic_v11 \
--step DIGI:pdigi_valid,L1,L1TrackTrigger,DIGI2RAW,HLT:@fake2 \
--geometry Extended2026D88 \
--filein file:TSG-Phase2HLTTDRWinter20GS-00085.root \
--era Phase2C9 \
--no_exec \
--mc \
-n $EVENTS || exit $? ;
