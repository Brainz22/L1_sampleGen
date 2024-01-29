import FWCore.ParameterSet.Config as cms
from Configuration.Generator.Pythia8CommonSettings_cfi import *
from Configuration.Generator.MCTunes2017.PythiaCP5Settings_cfi import *

generator = cms.EDFilter("Pythia8ConcurrentGeneratorFilter",
     maxEventsToPrint = cms.untracked.int32(1),
     pythiaPylistVerbosity = cms.untracked.int32(1),
     pythiaHepMCVerbosity = cms.untracked.bool(False),
     comEnergy = cms.double(14000.),
     
     PythiaParameters = cms.PSet(
          pythia8CommonSettingsBlock,
	      pythia8CP5SettingsBlock,
          pythia8_mycmd = cms.vstring('Higgs:useBSM = on',
                                      'HiggsBSM:gg2H2 = on',  ## ggH production process
                                      'HiggsBSM:allH2 = on',
                                      '25:m0        = 30',    ##M(Phi/a) 15,30,60 GeV
                                      '25:mMin      = 5',
                                      '25:mWidth    = 1.97331945E-13',
				      #'25:tau0      = 50',   ## ctau/lifetime of phi 0 mm, 10 mm, 50 mm (PYTHIA takes values in mm not cm)
                                      '25:0:bRatio  = 0.0',
                                      '25:1:bRatio  = 0.0',
                                      '25:2:bRatio  = 0.000',
                                      '25:3:bRatio  = 0.00',
                                      '25:4:bRatio  = 1.0',
                                      '25:5:bRatio  = 0.0',
                                      '25:6:bRatio  = 0.0',
                                      '25:7:bRatio  = 0.000',
                                      '25:8:bRatio  = 0.0',
                                      '25:9:bRatio  = 0.0',
                                      '25:10:bRatio = 0.00',
                                      '25:11:bRatio = 0.00',
                                      '25:12:bRatio = 0.0',
                                      '25:13:bRatio = 0.0',
                                      '25:0:meMode  = 100',
                                      '25:1:meMode  = 100',
                                      '25:2:meMode  = 100',
                                      '25:3:meMode  = 100',
                                      '25:4:meMode  = 100',
                                      '25:5:meMode  = 100',
                                      '25:6:meMode  = 100',
                                      '25:7:meMode  = 100',
                                      '25:8:meMode  = 100',
                                      '25:9:meMode  = 100',
                                      '25:10:meMode = 100',
                                      '25:11:meMode = 100',
                                      '25:12:meMode = 100',
                                      '25:13:meMode = 100',
                                      '35:m0        = 125', # M(H) = 125, 250 GeV
                                      '35:mWidth    = 0.00403',
                                      '35:0:bRatio  = 0.0',
                                      '35:1:bRatio  = 0.0',
                                      '35:2:bRatio  = 0.0',
                                      '35:3:bRatio  = 0.0',
                                      '35:4:bRatio  = 0.0',
                                      '35:5:bRatio  = 0.0',
                                      '35:6:bRatio  = 0.0',
                                      '35:7:bRatio  = 0.0',
                                      '35:8:bRatio  = 0.0',
                                      '35:9:bRatio  = 0.0',
                                      '35:10:bRatio  = 0.0',
                                      '35:11:bRatio  = 0.0',
                                      '35:12:bRatio  = 0.0',
                                      '35:13:bRatio  = 0.0',
                                      '35:14:bRatio  = 0.0',
                                      '35:15:bRatio  = 1.0',
                                      '35:16:bRatio  = 0.0',
                                      '35:17:bRatio  = 0.0',
                                      '35:18:bRatio  = 0.0',
                                      '35:19:bRatio  = 0.0',
                                      '35:20:bRatio  = 0.0',
                                      '35:0:meMode  = 100',
                                      '35:1:meMode  = 100',
                                      '35:2:meMode  = 100',
                                      '35:3:meMode  = 100',
                                      '35:4:meMode  = 100',
                                      '35:5:meMode  = 100',
                                      '35:6:meMode  = 100',
                                      '35:7:meMode  = 100',
                                      '35:8:meMode  = 100',
                                      '35:9:meMode  = 100',
                                      '35:10:meMode = 100',
                                      '35:11:meMode  = 100',
                                      '35:12:meMode  = 100',
                                      '35:13:meMode  = 100',
                                      '35:14:meMode  = 100',
                                      '35:15:meMode  = 100',
                                      '35:16:meMode  = 100',
                                      '35:17:meMode  = 100',
                                      '35:18:meMode  = 100',
                                      '35:19:meMode  = 100',
                                      '35:20:meMode = 100',
                                      ),

         parameterSets = cms.vstring('pythia8CommonSettings',
                                     'pythia8CP5Settings',
                                     'pythia8_mycmd')
     )
 )



ProductionFilterSequence = cms.Sequence(generator)
