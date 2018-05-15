#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=15:00:00
#SBATCH --mem=10GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

# loading modules required for trinity
module load Python/3.6.1-foss-2016b
# module laod GCC/5.4.0-2.26
module load BLAST+/2.6.0-foss-2016uofa-Python-2.7.11
module load HMMER/3.1b2-foss-2016uofa

source //fast/users/a1654797/busco/bin/activate

SeqeunceDIR=//fast/users/a1654797/busco/Sequences/metazoa_odb9

#//fast/users/a1654797/Busco_dir/Sequences/metazoa_odb9/
TrinityDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
ScriptDIR=/fast/users/a1654797/busco/scripts


python $ScriptDIR/run_BUSCO.py -i $TrinityDIR/Trinity.fasta -o eukaryota  -m transcriptome --lineage_path /fast/users/a1654797/busco/Sequences/eukaryota_odb9 


deactivate
