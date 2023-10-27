#!/bin/bash

doSubmit=true
dt=`date '+%Y%m%d_%H%M%S'`
reTar=true

lxplusBase=/afs/cern.ch/work/d/ddiaz/L1SampleGen/L1_sampleGen
scriptsDir=/afs/cern.ch/work/d/ddiaz/L1SampleGen/L1_sampleGen/12_5_x
ntupleDir=/afs/cern.ch/work/d/ddiaz/L1SampleGen/L1_sampleGen/Tuples-el8
sampleName="HiddenGluGluH_mH-125_Phi-30_ctau-100"
outdir="/store/user/ddiaz/L1LLPSample/"${sampleName}"_TuneCP5_14TeV-pythia8/condor_FALL22_UAF/$dt/0000/"
NJobs=10
NEvents=10 


#get the two CMSSW working areas
if [ ${reTar} = true ]
then
  cd 12_5_x/
  tar -czf  CMSSW_125x.tar.gz CMSSW_12_5_2_patch1
  cp CMSSW_125x.tar.gz $lxplusBase
  cd $lxplusBase
  pwd
  cd $ntupleDir
  pwd
  tar -czf  CMSSW_125x_tup.tar.gz CMSSW_12_5_2_patch1
  cp CMSSW_125x_tup.tar.gz $lxplusBase
  cd $lxplusBase
fi


mkdir -p "logs/$dt"
echo "logs at:  logs/$dt"
Proxy_path=/afs/cern.ch/user/d/ddiaz/private/x509up

 #write base for submit file
 printf "universe = vanilla\n" > submitfile
 printf '+JobFlavour = "workday"\n' > submitfile
 printf "Executable = runJob.sh\n" >> submitfile
 printf "Should_Transfer_Files = YES \n" >> submitfile
 #printf "WhenToTransferOutput = ON_EXIT\n" >> submitfile
 printf "Transfer_Input_Files = $scriptsDir/setup.sh, $scriptsDir/MakeGS_cfg.py, $scriptsDir/MakeDIGI_cfg.py, CMSSW_125x.tar.gz, CMSSW_125x_tup.tar.gz\n" >> submitfile

 printf "notify_user = $(whoami)@cern.ch\n" >> submitfile
 printf "x509userproxy = $Proxy_path\n" >> submitfile
 #printf 'requirements = (OpSysAndVer =?= "CentOS8")\n' >> submitfile
 printf 'MY.SingularityImage = "/cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/batch-team/containers/plusbatch/cs8-full:latest"\n' >> submitfile
 printf "MY.XRDCP_CREATE_DIR = True\n" >> submitfile
 printf "Output = logs/$dt/\$(Cluster)_\$(Process).stdout\n" >> submitfile
 printf "Error  = logs/$dt/\$(Cluster)_\$(Process).stderr\n" >> submitfile
 printf "Log    = logs/$dt/\$(Cluster)_\$(Process).log\n" >> submitfile
 printf "\n" >> submitfile
 #printf "output_destination = root://eosuser.cern.ch//eos/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kDIGI_Spring22_UAF/"$dt"/"$(ClusterId)"/ \n" >>submitfile
 #printf "MY.XRDCP_CREATE_DIR = True\n" >> submitfile

 printf "Arguments = $Proxy_path ${sampleName}_\$(ProcId).root $NJobs $NEvents $outdir \n" >> submitfile
 #printf "Arguments = $Proxy_path test.root $NJobs $NEvents $outdir \n" >> submitfile
 printf "Queue ${NJobs}\n" >> submitfile
 printf "\n" >> submitfile

 if [ ${doSubmit} = true ]
 then
  xrdfs root://redirector.t2.ucsd.edu:1095/ mkdir -p $outdir
  condor_submit submitfile
 fi
