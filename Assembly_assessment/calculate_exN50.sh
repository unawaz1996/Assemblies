#!/bin/bash 


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=04:00:00
#SBATCH --mem=55GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a
module load Trinity/2.5.1-foss-2016b


matrix=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/Expression_matrix
Trinity=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
ExN50=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/misc/contig_ExN50_statistic.pl

$ExN50 ${matrix}/Trinity_trans.isoform.TMM.EXPR.matrix ${Trinity}/Trinity.fasta | tee ExN50.stats
