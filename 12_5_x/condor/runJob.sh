#!/bin/bash

export X509_USER_PROXY=$1
voms-proxy-info -all
voms-proxy-info -all -file $1
source /cvmfs/cms.cern.ch/cmsset_default.sh

echo "working area: " $PWD
ls
echo "opening CMSSW"
tar -zxf CMSSW.tar.gz
cd CMSSW_12_5_2_patch1/src 
cmsenv
cd - 


echo @@@@@@@@@@  RUNNING STEP 1 @@@@@@@@@@@@@@@@@@@@@2
cmsRun MakeGS_cfg.py maxEvents=$4

echo @@@@@@@@@@  RUNNING STEP 2 @@@@@@@@@@@@@@@@@@@@@2
cmsRun MakeDIGI_cfg.py maxEvents=$4 outputFile=$2

echo "Do an ls to see if output roots both generated"
ls
echo @@@@@@@@@@  COPYING OUTPUT @@@@@@@@@@@@@@@@@@@@@2
xrdcp *.root root://redirector.t2.ucsd.edu:1095/$4 
