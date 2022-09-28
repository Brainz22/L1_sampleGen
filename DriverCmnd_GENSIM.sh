# cmsDriver command  Modified from Mohammed Darwish
# Produces equivalent config file are the mcm test command
cmsDriver.py \
Configuration/GenProduction/python/TSG-PhaseIISpring22GS-00085-fragment.py \
--eventcontent RAWSIM \
--customise Configuration/DataProcessing/Utils.addMonitoring \
--datatier GEN-SIM \
--conditions 123X_mcRun4_realistic_v11 \
--beamspot HLLHC14TeV \
--customise_commands process.source.numberEventsInLuminosityBlock="cms.untracked.uint32(1000)" \
--step GEN,SIM \
--nThreads 8 \
--geometry Extended2026D88 \
--era Phase2C17I13M9  \
--no_exec \
--mc \
-n 38 \
--fileout file:step0.root
