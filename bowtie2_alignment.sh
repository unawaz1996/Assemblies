#!/bin/bash


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=01-00:00
#SBATCH --mem=75GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load Bowtie2/2.2.9-foss-2016b
module load SAMtools/1.3.1-foss-2016b
module load BamTools/2.4.1-foss-2016uofa


ReadsDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
AssemblyDir=//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
BowtieDIR=//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Statistics/RNA-representation


bowtie2-build $AssemblyDir/Trinity.fasta Trinity.fasta ;

cd $ReadsDIR

READ=$(ls *_R1_val_1.fq)

for file in ${READ}; do

	readname=${file%_R1_val_1.fq}

	bowtie2  --local -p 10 -q --no-unal -x ${BowtieDIR}/Trinity.fasta -1 $ReadsDIR/${readname}_R1_val_1.fq -2 $ReadsDIR/${readname}_R2_val_2.fq 2>&1 1> /dev/null | tee ${readname}_align_stats.txt

done
