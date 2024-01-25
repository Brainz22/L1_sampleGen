# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py --python_filename MakeGS_cfg-Test.py --eventcontent RAWSIM --customise Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions 125X_mcRun4_realistic_v2 --beamspot HLLHC14TeV --customise_commands process.source.numberEventsInLuminosityBlock=cms.untracked.uint32(100) --step GEN,SIM --nThreads 8 --geometry Extended2026D88 --era Phase2C17I13M9 --no_exec --mc -n 5 --fileout file:GS.root
import FWCore.ParameterSet.Config as cms

import FWCore.ParameterSet.VarParsing as VarParsing
options = VarParsing.VarParsing('analysis')
options.maxEvents = 5
options.parseArguments()


from Configuration.Eras.Era_Phase2C17I13M9_cff import Phase2C17I13M9

process = cms.Process('SIM',Phase2C17I13M9)

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.Geometry.GeometryExtended2026D88Reco_cff')
process.load('Configuration.Geometry.GeometryExtended2026D88_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')
process.load('Configuration.StandardSequences.Generator_cff')
process.load('IOMC.EventVertexGenerators.VtxSmearedHLLHC14TeV_cfi')
process.load('GeneratorInterface.Core.genFilterSummary_cff')
process.load('Configuration.StandardSequences.SimIdeal_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(options.maxEvents),
    output = cms.optional.untracked.allowed(cms.int32,cms.PSet)
)

# Input source
process.source = cms.Source("EmptySource")

process.options = cms.untracked.PSet(
    FailPath = cms.untracked.vstring(),
    IgnoreCompletely = cms.untracked.vstring(),
    Rethrow = cms.untracked.vstring(),
    SkipEvent = cms.untracked.vstring(),
    accelerators = cms.untracked.vstring('*'),
    allowUnscheduled = cms.obsolete.untracked.bool,
    canDeleteEarly = cms.untracked.vstring(),
    deleteNonConsumedUnscheduledModules = cms.untracked.bool(True),
    dumpOptions = cms.untracked.bool(False),
    emptyRunLumiMode = cms.obsolete.untracked.string,
    eventSetup = cms.untracked.PSet(
        forceNumberOfConcurrentIOVs = cms.untracked.PSet(
            allowAnyLabel_=cms.required.untracked.uint32
        ),
        numberOfConcurrentIOVs = cms.untracked.uint32(0)
    ),
    fileMode = cms.untracked.string('FULLMERGE'),
    forceEventSetupCacheClearOnNewRun = cms.untracked.bool(False),
    makeTriggerResults = cms.obsolete.untracked.bool,
    numberOfConcurrentLuminosityBlocks = cms.untracked.uint32(0),
    numberOfConcurrentRuns = cms.untracked.uint32(1),
    numberOfStreams = cms.untracked.uint32(0),
    numberOfThreads = cms.untracked.uint32(1),
    printDependencies = cms.untracked.bool(False),
    sizeOfStackForThreadsInKB = cms.optional.untracked.uint32,
    throwIfIllegalParameter = cms.untracked.bool(True),
    wantSummary = cms.untracked.bool(False)
)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    annotation = cms.untracked.string('Configuration/GenProduction/python/TSG-Phase2Fall22GS-00122-fragment.py nevts:5'),
    name = cms.untracked.string('Applications'),
    version = cms.untracked.string('$Revision: 1.19 $')
)

# Output definition

process.RAWSIMoutput = cms.OutputModule("PoolOutputModule",
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('generation_step')
    ),
    compressionAlgorithm = cms.untracked.string('LZMA'),
    compressionLevel = cms.untracked.int32(1),
    dataset = cms.untracked.PSet(
        dataTier = cms.untracked.string('GEN-SIM'),
        filterName = cms.untracked.string('')
    ),
    eventAutoFlushCompressedSize = cms.untracked.int32(20971520),
    fileName = cms.untracked.string('file:GS.root'),
    outputCommands = process.RAWSIMEventContent.outputCommands,
    splitLevel = cms.untracked.int32(0)
)

# Additional output definition

# Other statements
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '125X_mcRun4_realistic_v2', '')

process.generator = cms.EDFilter("Pythia8ConcurrentGeneratorFilter",
    PythiaParameters = cms.PSet(
        parameterSets = cms.vstring(
            'pythia8CommonSettings',
            'pythia8CP5Settings',
            'pythia8_mycmd'
        ),
        pythia8CP5Settings = cms.vstring(
            'Tune:pp 14',
            'Tune:ee 7',
            'MultipartonInteractions:ecmPow=0.03344',
            'MultipartonInteractions:bProfile=2',
            'MultipartonInteractions:pT0Ref=1.41',
            'MultipartonInteractions:coreRadius=0.7634',
            'MultipartonInteractions:coreFraction=0.63',
            'ColourReconnection:range=5.176',
            'SigmaTotal:zeroAXB=off',
            'SpaceShower:alphaSorder=2',
            'SpaceShower:alphaSvalue=0.118',
            'SigmaProcess:alphaSvalue=0.118',
            'SigmaProcess:alphaSorder=2',
            'MultipartonInteractions:alphaSvalue=0.118',
            'MultipartonInteractions:alphaSorder=2',
            'TimeShower:alphaSorder=2',
            'TimeShower:alphaSvalue=0.118',
            'SigmaTotal:mode = 0',
            'SigmaTotal:sigmaEl = 21.89',
            'SigmaTotal:sigmaTot = 100.309',
            'PDF:pSet=LHAPDF6:NNPDF31_nnlo_as_0118'
        ),
        pythia8CommonSettings = cms.vstring(
            'Tune:preferLHAPDF = 2',
            'Main:timesAllowErrors = 10000',
            'Check:epTolErr = 0.01',
            'Beams:setProductionScalesFromLHEF = off',
            'SLHA:minMassSM = 1000.',
            'ParticleDecays:limitTau0 = on',
            'ParticleDecays:tau0Max = 10',
            'ParticleDecays:allowPhotonRadiation = on'
        ),
        pythia8_mycmd = cms.vstring(
            'Higgs:useBSM = on',
            'HiggsBSM:gg2H2 = on',
            'HiggsBSM:allH2 = on',
            '25:m0        = 30',
            '25:mMin      = 5',
            '25:mWidth    = 1.9732698E-15',
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
            '35:m0        = 125',
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
            '35:20:meMode = 100'
        )
    ),
    comEnergy = cms.double(14000.0),
    maxEventsToPrint = cms.untracked.int32(1),
    pythiaHepMCVerbosity = cms.untracked.bool(False),
    pythiaPylistVerbosity = cms.untracked.int32(1)
)


process.ProductionFilterSequence = cms.Sequence(process.generator)

# Path and EndPath definitions
process.generation_step = cms.Path(process.pgen)
process.simulation_step = cms.Path(process.psim)
process.genfiltersummary_step = cms.EndPath(process.genFilterSummary)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.RAWSIMoutput_step = cms.EndPath(process.RAWSIMoutput)

# Schedule definition
process.schedule = cms.Schedule(process.generation_step,process.genfiltersummary_step,process.simulation_step,process.endjob_step,process.RAWSIMoutput_step)
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)

#Setup FWK for multithreaded
process.options.numberOfThreads = 8
process.options.numberOfStreams = 0
# filter all path with the production filter sequence
for path in process.paths:
	getattr(process,path).insert(0, process.ProductionFilterSequence)

# customisation of the process.

# Automatic addition of the customisation function from Configuration.DataProcessing.Utils
from Configuration.DataProcessing.Utils import addMonitoring 

#call to customisation function addMonitoring imported from Configuration.DataProcessing.Utils
process = addMonitoring(process)

# End of customisation functions


# Customisation from command line

process.source.numberEventsInLuminosityBlock=cms.untracked.uint32(100)
# Add early deletion of temporary data products to reduce peak memory need
from Configuration.StandardSequences.earlyDeleteSettings_cff import customiseEarlyDelete
process = customiseEarlyDelete(process)
# End adding early deletion

#Adding randomizer lines
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)
randSvc.populate()
