import Bio
from Bio import SeqIO

import pylab

Assembly = "//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta"


# parses the  FASTA file and compiles a list of all the sequence lengths
sizes = [len(rec) for rec in SeqIO.parse(Assembly, "fasta")]


# to plot a histogram
pylab.hist(sizes, bins=30, color = "skyblue", edgecolor = "white", linewidth = 0.5)

pylab.title("Illumina Contig Length Distribution") #title of the graph
pylab.yscale('log') #scale of y-axis
pylab.ylabel("Count") #title for y axis
pylab.xlabel("Sequence length (bp)") #title for x-axis
pylab.savefig("contig_length_distribution") 



