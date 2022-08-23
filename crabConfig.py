from CRABClient.UserUtilities import config
config = config()

config.General.requestName = 'SendToUAF'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'TSG-Phase2HLTTDRWinter20GS-00191_1_cfg.py'

config.Data.outputPrimaryDataset = 'CrabTestL1Gen'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 10
NJOBS = 10  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True
#config.Data.outputDatasetTag = 'CRAB3_tutorial_Aug2021_MC_generation'

#config.Site.storageSite = 'T2_CH_CERN'
#config.Data.outLFNDirBase = '/store/user/ddiaz/'
##config.Site.storageSite = 'T3_CH_CERNBOX'
##config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'
config.Site.storageSite = 'T2_US_UCSD'
config.Data.outLFNDirBase = '/store/user/ddiaz/L1LLPSample'

#config = Configuration()
#config.section_('General')
#
#config.General.requestName = 'test1'
#config.section_('JobType')
#config.JobType.psetName = 'TSG-Phase2HLTTDRWinter20GS-00191_1_cfg.py'
#config.JobType.pluginName = 'PrivateMC'
#config.section_('Data')
#config.Data.outputDatasetTag = 'L1Gen_test1'
#config.Data.publication = True
#config.Data.unitsPerJob = 100
#config.Data.splitting = 'EventBased'
#config.Data.outputPrimaryDataset = 'CrabTestL1GEN'
#config.Data.totalUnits = 1000
#config.section_('Site')
#config.Site.storageSite = 'T2_CH_CERN'
#config.section_('User')
#config.section_('Debug')
