# HiddenGluGluH_mH-125_Phi-15_ctau-100_14TeV-pythia8_TuneCP5
# TSG-Phase2HLTTDRWinter20GS-00191
# TSG-Phase2HLTTDRWinter20DIGI-00205

from CRABClient.UserUtilities import config
config = config()

config.General.requestName = '_Test_100kDIGI_Spring22_UAF'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
#config.JobType.psetName = 'TSG-PhaseIISpring22GS-00085_1_cfg.py'
config.JobType.psetName = 'TSG-Phase2HLTTDRSpring22DIGI-00085_cfg.py'

config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 5
#NJOBS = 5 #500  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = 1 #-1
config.Data.publication = True
#only needed for DIGI
config.Data.inputDBS = "phys03"
config.Data.inputDataset = '/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/ddiaz-crab_100kGenSim_Spring22_UAF-6c9639b5d54cca694228f42ad4066d7a/USER'

#config.Site.storageSite = 'T2_CH_CERN'
#config.Data.outLFNDirBase = '/store/user/ddiaz/'

##config.Site.storageSite = 'T3_CH_CERNBOX'
##config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'

config.Site.storageSite = 'T2_US_UCSD'
config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'

