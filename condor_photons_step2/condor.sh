#!/bin/bash
set -e

export X509_USER_PROXY=/grid_mnt/vol_home/llr/cms/cappati/.t3/proxy.cert

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /home/llr/cms/cappati/240821_ticl/CMSSW_14_1_0_pre4/
cmsenv
cd - 

cat  <<EOF >>CloseByParticle_Photon_GEN_SIM.py
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper 
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService) 
randSvc.populate() 

process.source.firstLuminosityBlock = cms.untracked.uint32(${INDEX})
EOF
cmsRun CloseByParticle_Photon_GEN_SIM.py

cat  <<EOF >>step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper 
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService) 
randSvc.populate() 
EOF
cmsRun step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py

mkdir -p /grid_mnt/data__data.polcms/cms/cappati/240821_photonsD98_2-15GeV_step2/
mv step2.root /grid_mnt/data__data.polcms/cms/cappati/240821_photonsD98_2-15GeV_step2/step2_${INDEX}.root

