#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 1
#SBATCH -N 1 
#SBATCH -c 12
#SBATCH --time=3-00:00
#SBATCH --mem=110GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


##module load BLAST+/2.6.0-foss-2016b-Python-2.7.13
module load BLAST+/2.2.31-foss-2015b-Python-2.7.11
module load Ruby/2.3.4-foss-2017a


AssemblyDIR=/fast/users/a1654797/Second_try/Assembly_assessment/TransRate/transRate_filtered/reads/RSEM
ReadDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
outDIR=//fast/users/a1654797/Second_try/Assembly_assessment/TransRate/transRate_filtered/RSEM


echo "Initialising files:"
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir $outDIR
fi


cd ${AssemblyDIR}

ASSEMBLY=$(ls *.fasta)

for file in ${ASSEMBLY}; 
do
	assembly_name=${file%.fasta}

//fast/users/a1654797/detonate/detonate-1.11/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ${AssemblyDIR}/${assembly_name}.fasta --left ${ReadDIR}/all_R1.fq --right ${ReadDIR}/all_R2.fq  --output ${outDIR}/${assembly_name}

done 
