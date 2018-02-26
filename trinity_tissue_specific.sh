#!/bin/bash

#running tissue specific runs for Trinity 

#SBATCH -p highmem
#SBATCH -n 16
#SBATCH --time=3-00:00
#SBATCH --mem=1000GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

# loading modules required for trinity
module load Trinity/2.5.1-foss-2016b
module load Jellyfish/2.2.6-foss-2016b
module load Java/1.8.0_71
Bowtie2/2.2.9-foss-2016b
Perl/5.24.0-foss-2017a

readDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore/tissue_specific
outDIR=//fast/users/a1654797/Second_try/Trinity_assembly/Tissue_specific/trinity_tissue_dir

if [ -d $outDIR]; then
	echo "$outDIR already exists"
else 
	mkdir $outDIR
fi

cd ${readDIR} 
READS=$(ls *_R1_1.fq)


for f in ${READS} ;
do 
	READNAME=${f%_R1_1.fq}

	"Commencing Trinity Assembly for $FILENAME"
		Trinity --seqType fq --max_memory 500G --left $readDIR/${READNAME}_R1_1.fq --right $readDIR/${READNAME}_R2_2.fq --CPU 16 --output ${outDIR}/${READNAME}.trinity

done