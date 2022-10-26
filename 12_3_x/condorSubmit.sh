#cmsrun TSG-Phase2HLTTDRSpring22DIGI-00085_TEST2_cfg.py /store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085_411.root

doSubmit=true
dt=`date '+%Y%m%d_%H%M%S'`
sampleName="/store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kGenSim_Spring22_UAF/220915_181959/0000/TSG-PhaseIISpring22GS-00085"
outdir="/store/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/condor_100kDIGI_Spring22_UAF/$dt/0000/"

cd ../
tar -czf  CMSSW.tar.gz CMSSW_12_3_6
mv CMSSW.tar.gz 12_3_x/
cd 12_3_x/ 


mkdir -p "logs/$dt"

Proxy_path=/afs/cern.ch/user/d/ddiaz/private/x509up

 #write base for submit file
 printf "universe = vanilla\n" > submitfile
 printf "+JobFlavour = 'workday'\n" > submitfile
 printf "Executable = runjob.sh\n" >> submitfile
 printf "Should_Transfer_Files = YES \n" >> submitfile
 printf "WhenToTransferOutput = ON_EXIT\n" >> submitfile
 printf "Transfer_Input_Files = TSG-Phase2HLTTDRSpring22DIGI-00085_cfg.py, CMSSW.tar.gz\n" >> submitfile

 printf "notify_user = $(whoami)@cern.ch\n" >> submitfile
 printf "x509userproxy = $Proxy_path" >> submitfile
 printf "\n" >> submitfile
 printf "Output = logs/$dt/\$(Cluster)_\$(Process).stdout\n" >> submitfile
 printf "Error  = logs/$dt/\$(Cluster)_\$(Process).stderr\n" >> submitfile
 printf "Log    = logs/$dt/\$(Cluster)_\$(Process).log\n" >> submitfile
 printf "\n" >> submitfile
 #printf "output_destination = root://eosuser.cern.ch//eos/user/ddiaz/L1LLPSample/HiddenGluGluH_mH-125_Phi-30_ctau-100_TuneCP5_14TeV-pythia8/crab_100kDIGI_Spring22_UAF/"$dt"/"$(ClusterId)"/ \n" >>submitfile
 #printf "MY.XRDCP_CREATE_DIR = True\n" >> submitfile

 for N in {1..2}
 do
  printf "Arguments = $Proxy_path "$sampleName"_"$N".root $N $outdir \n" >> submitfile
  printf "Queue\n" >> submitfile
  printf "\n" >> submitfile
 done

 if [ ${doSubmit} = true ]
 then
  condor_submit submitfile
 fi
