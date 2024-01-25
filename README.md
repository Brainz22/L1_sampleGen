# Set up Ntuple producer
```
export SCRAM_ARCH=el8_amd64_gcc10
mkdir Tuples-el8; cd Tuples-el8
cmsrel CMSSW_12_5_2_patch1
cd CMSSW_12_5_2_patch1/src
cmsenv

git cms-checkout-topic -u p2l1pfp:L1PF_12_5_X
git cms-addpkg DataFormats/L1TParticleFlow
git cms-addpkg DataFormats/L1TCorrelator
git cms-addpkg L1Trigger/Phase2L1ParticleFlow
git cms-addpkg L1Trigger/TrackTrigger
git cms-addpkg SimTracker/TrackTriggerAssociation
git cms-addpkg L1Trigger/Phase2L1ParticleFlow

git clone git@github.com:ddiaz006/FastPUPPI.git -b 12_5_X

scram b -j8
```
# Set up MC generation
```

```


# Utilities
## Get Latest version of the fragment code
```
rm -f request_fragment_check.py
wget -q https://raw.githubusercontent.com/cms-sw/genproductions/master/bin/utils/request_fragment_check.py
chmod +x request_fragment_check.py
```
