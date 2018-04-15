import Bio
from Bio import SeqIO

import pylab

Assembly = "/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta"

sizes = [len(rec) for rec in SeqIO.parse(Assembly, "fasta")]

pylab.hist(sizes, bins=40, color = "cornflowerblue", edgecolor = "white", linewidth = 0.5)

#pylab.title("Contig Length Distribution")
pylab.yscale('log')
pylab.ylabel("Count")
pylab.xlabel("Sequence length (bp)")
pylab.savefig("bin40_contig_length_distribution")



