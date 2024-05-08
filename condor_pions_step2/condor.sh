#!/bin/bash
set -e

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /home/llr/cms/cappati/240329_TICLv5/CMSSW_14_0_0_pre0/
cmsenv
cd - 

cat  <<EOF
EOF >>CloseByParticle_Pion_GEN_SIM.py
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper 
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService) 
randSvc.populate() 

process.source.firstLuminosityBlock = cms.untracked.uint32($INDEX)


EOF
cmsRun CloseByParticle_Pion_GEN_SIM.py

cat  <<EOF
EOF >>step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper 
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService) 
randSvc.populate() 
EOF
cmsRun step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py

mkdir -p /grid_mnt/data__data.polcms/cms/cappati/240507_pionsD98_step2/
mv step2.root /grid_mnt/data__data.polcms/cms/cappati/240507_pionsD98_step2/step2_$INDEX.root
EOF
EOF