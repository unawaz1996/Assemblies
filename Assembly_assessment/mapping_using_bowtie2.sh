#!/bin/bash


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=10:00:00
#SBATCH --mem=75GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load Bowtie2/2.2.9-foss-2016b
module load SAMtools/1.3.1-foss-2016b
module load BamTools/2.4.1-foss-2016uofa


TrinityDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
AssemblyDir=//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
BowtieDIR=//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Statistics/RNA-representation

#this calculates the number of reads aligned to the assembly 

# builds a bowtie alignment database
bowtie2-build $AssemblyDir/Trinity.fasta Trinity.fasta ;

#aligns the fastq reads back to the assembly
bowtie2  --local -p 10 -q --no-unal -x ${BowtieDIR}/Trinity.fasta -1 $TrinityDIR/all_R1.fq -2 $TrinityDIR/all_R2.fq -S trinity_all_paired_end_bowtie.sam 1>bowtie2_trinity.log 2>bowtie_trinity.err ;

# converts sam format to bam format
samtools view -bS trinity_all_paired_end_bowtie.sam > trinity_paired_end_bowtie.bam && rm trinity_all_paired_end_bowtie.sam ; 

#Classify alignments as properly paired (i.e. on the same contig with a reasonable insert length), aligned, or not aligned using the samtools flagstat tool
samtools flagstat trinity_paired_end_bowtie.bam > trinity_backmap_paired_flagstat.txt
