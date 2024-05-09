# Condor setup

Produce step3 files from step2 ntuples already produced.

1.  Takes configuration from step3_ticlv5.py file (in ../)
2.  Specify the CMSSW directory and output directory in condor_step3.sh
3.  Specify the config file (../step3_ticlv5.py) and input directory (containing step2 files) in condor_step3.sub
4.  Remember to create a directory called **logs** where the logs will be stored

Run with: 

```
condor_submit condor_step3.sub
```

