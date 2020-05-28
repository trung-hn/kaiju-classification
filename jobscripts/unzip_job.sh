#!/bin/bash
## dos2unix file
#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -M tnh48@drexel.edu
#$ -P rosenclassPrj
#$ -l h_rt=24:00:00
#$ -l h_vmem=170G
#$ -l m_mem_free=164G
#$ -q all.q

. /etc/profile.d/modules.sh

### These four modules must ALWAYS be loaded
module load shared
module load proteus
module load sge/univa
module load gcc


tar zxvf kaiju_db_nr_euk_2019-06-25.tgz

