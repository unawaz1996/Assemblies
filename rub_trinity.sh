#!/bin/bash
## For running Trinity on Phoenix


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


TrinityDIR=/fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore/Sequences
outDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTG/assembly_trinity

if [ -d $outDIR]; then 
  echo "$outDIR exists"
else
  mkdir $outDIR
fi

Trinity --seqType fq --max_memory 1000G --left $TrinityDIR/all_R1.fq --right $TrinityDIR/all_R2.fq  --CPU 16 -o outDIR
