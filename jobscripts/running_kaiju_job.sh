#!/bin/bash
## dos2unix file
#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -M tnh48@drexel.edu
#$ -P rosenclassPrj
#$ -l h_rt=24:00:00
#$ -l h_vmem=80G
#$ -l m_mem_free=76G
#$ -q all.q

. /etc/profile.d/modules.sh

### These four modules must ALWAYS be loaded
module load shared
module load proteus
module load sge/univa
module load gcc


~/ECES650/tutorial9/kaiju/bin/kaiju -t ../kaijudb/nodes.dmp -f ../kaijudb/nr_euk/kaiju_db_nr_euk.fmi -i ../Sample_EL5602_F1_HL-P_FIB.R1.trimmed.fastq -o kaiju_nr_euk_greedy.out
~/ECES650/tutorial9/kaiju/bin/kaiju -t ../kaijudb/nodes.dmp -f ../kaijudb/nr_euk/kaiju_db_nr_euk.fmi -i ../Sample_EL5602_F1_HL-P_FIB.R1.trimmed.fastq -a mem -o kaiju_nr_euk_mem.out
~/ECES650/tutorial9/kaiju/bin/kaiju -t ../kaijudb_refseq/nodes.dmp -f ../kaijudb_refseq/refseq/kaiju_db_refseq.fmi -i ../Sample_EL5602_F1_HL-P_FIB.R1.trimmed.fastq -o kaiju_refseq_greedy.out
~/ECES650/tutorial9/kaiju/bin/kaiju -t ../kaijudb_refseq/nodes.dmp -f ../kaijudb_refseq/refseq/kaiju_db_refseq.fmi -i ../Sample_EL5602_F1_HL-P_FIB.R1.trimmed.fastq -a mem -o kaiju_refseq_mem.out

# Convert to krona
~/ECES650/tutorial9/kaiju/bin/kaiju2krona -t ../kaijudb/nodes.dmp -n ../kaijudb/names.dmp -i kaiju_nr_euk_greedy.out -o kaiju_nr_euk_greedy.out.krona
~/ECES650/tutorial9/kaiju/bin/kaiju2krona -t ../kaijudb/nodes.dmp -n ../kaijudb/names.dmp -i kaiju_nr_euk_mem.out    -o kaiju_nr_euk_mem.out.krona

~/ECES650/tutorial9/kaiju/bin/kaiju2krona -t ../kaijudb/nodes.dmp -n ../kaijudb/names.dmp -i kaiju_refseq_greedy.out -o kaiju_refseq_greedy.out.krona
~/ECES650/tutorial9/kaiju/bin/kaiju2krona -t ../kaijudb/nodes.dmp -n ../kaijudb/names.dmp -i kaiju_refseq_mem.out    -o kaiju_refseq_mem.out.krona

# Make Kaiju Summary take
~/ECES650/tutorial9/kaiju/bin/kaiju2table -t ../kaijudb/nodes.dmp -n ../kaijudb/names.dmp -r genus -o kaiju_summary.tsv kaiju_nr_euk_greedy.out kaiju_nr_euk_mem.out kaiju_refseq_greedy.out kaiju_refseq_mem.out