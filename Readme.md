# kaiju-classification

## Step to replicate
#### 1. Download and Compile Kaiju:
- `git clone https://github.com/bioinformatics-centre/kaiju.git`
- `cd kaiju/src`
- `make`
#### 2. Create the reference database and index:
- Download `refseq` and `nr_euk` from http://kaiju.binf.ku.dk/server. Both files are very big (14GBs and 42 GBs). It is recommended to use `wget` for this.
- Unzip with `tar zxvf kaiju_db_nr_euk_2019-06-25.tgz`. Because of the size of the file, upto ~100 GBs of RAM is used during this process. You should submit a job for this. Example of a jobscript for this step can be found [here](jobscripts/unzip_job.sh). This step takes a few hours to complete
#### 3. Running Kaiju:
- There are 3 required arguments `kaiju -t nodes.dmp -f kaiju_db_*.fmi -i inputfile.fastq`. `nodes.dmp` and `kaiju_db_*.fmi` are from step 2. 
- A jobscript we created for this step can be found [here](jobscripts/running_kaiju_job.sh)


## Reference:
https://github.com/bioinformatics-centre/kaiju#classification-accuracy
