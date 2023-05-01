# cmsDriver command
cmsDriver.py \
Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py \
--python_filename MakeGS_cfg.py \
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
-n 100 \
--fileout file:GS.root
#--fileout file:TSG-Phase2Fall22GS-00122.root \
#--python_filename TSG-Phase2Fall22GS-00122_1_cfg.py \
