#!/bin/bash
set -e

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /home/llr/cms/cappati/240826_ticl_step3/CMSSW_14_1_X_2024-08-26-1100/
cmsenv
cd - 

cat  <<EOF >>step3_ticlv5.py
process.source.fileNames = cms.untracked.vstring('file:$INPUT_FOLDER/step2_$INDEX.root')
EOF

cmsRun -n 8 step3_ticlv5.py

set +e
mkdir -p /grid_mnt/data__data.polcms/cms/cappati/240827_photonsD98_2-15GeV_step3/
mv dumper.root /grid_mnt/data__data.polcms/cms/cappati/240827_photonsD98_2-15GeV_step3/step3_dumper_$INDEX.root

