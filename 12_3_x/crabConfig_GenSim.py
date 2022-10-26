# HiddenGluGluH_mH-125_Phi-15_ctau-100_14TeV-pythia8_TuneCP5
# TSG-Phase2HLTTDRWinter20GS-00191
# TSG-Phase2HLTTDRWinter20DIGI-00205

from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'Test_100kGenSim_Spring22_UAF'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'TSG-PhaseIISpring22GS-00085_1_cfg.py'

config.Data.outputPrimaryDataset = 'HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 200
NJOBS = 500  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True

#config.Site.storageSite = 'T2_CH_CERN'
#config.Data.outLFNDirBase = '/store/user/ddiaz/'

##config.Site.storageSite = 'T3_CH_CERNBOX'
##config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'

config.Site.storageSite = 'T2_US_UCSD'
config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'

