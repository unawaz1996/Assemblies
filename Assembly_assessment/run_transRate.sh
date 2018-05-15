#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 20
#SBATCH -N 1 
#SBATCH --time=3-00:00
#SBATCH --mem=50GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


##module load BLAST+/2.6.0-foss-2016b-Python-2.7.13
module load BLAST+/2.2.31-foss-2015b-Python-2.7.11
module load Ruby/2.3.4-foss-2017a


AssemblyDIR=/fast/users/a1654797/Second_try/Assembly_assessment/TransRate/transRate_no_reference/trinity_default/Trinity
ReadDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
outDIR=/fast/users/a1654797/Second_try/Assembly_assessment/TransRate/transRate_no_reference/trinity_default/Trinity/optimization/only_good



echo "Initialising files:"
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir -p $outDIR
fi

//fast/users/a1654797/detonate/detonate-1.11/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ${AssemblyDIR}/Trinity.fasta --left ${ReadDIR}/all_R1.fq --right ${ReadDIR}/all_R2.fq  --output ${outDIR}
