#!/bin/bash

export X509_USER_PROXY=$1
voms-proxy-info -all
voms-proxy-info -all -file $1
source /cvmfs/cms.cern.ch/cmsset_default.sh

pwd
ls
tar -zxf CMSSW.tar.gz
cd CMSSW_12_3_6/src 
cmsenv
cd - 
pwd
ls
cmsRun TSG-Phase2HLTTDRSpring22DIGI-00085_cfg.py $2 $3
xrdcp *.root root://redirector.t2.ucsd.edu:1095/$4 
#tar -zxvf cms_setup.tar.gz
#cd CMSSW_12_3_6/src
