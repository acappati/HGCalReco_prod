# Condor setup

Produces step1 files with the setup: CloseByParticle_Pion_GEN_SIM.py 

and step2 files with the setup: step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py

1. Specify the particle quantities in the step1 configuration (PID, energy, ..)
2. Specify the output directory for step2 files in condor.sh (step1 are not saved)
3. in case, in condor.sh specify also the path where there is the environment used (L7)
4. Specify the config files (CloseByParticle_Pion_GEN_SIM.py, step2_DIGI_L1TrackTrigger_L1_DIGI2RAW_HLT_PU.py) and the samples indexes in condor.sub
5. Remember to create a directory called **logs** where the logs will be stored

Run with: 
```
condor_submit condor.sub
```