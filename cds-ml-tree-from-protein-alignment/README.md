# Codon tree 

`protein_cds_tree_ml.sh`:<br /> <br /> <br />

* Aligns coding sequence to protein sequence to make a codon alignment using `Pal2nal`.
* Finds the best fitting substitution model for the alignment using `Jmodeltest2`.
* Generates an ML tree(bootstrap 1000) using `PhyML`. 

Requirements in $PATH:
* trimal-v1.2
* Clustalo.1.2.4
* PhyML-3.1
* Jmodeltest-2.1.10 
* pal2nal.pl

<br /> <br /> <br />

		USAGE:  ./protein_cds_tree_ml.sh  sequences.fasta 

<br /> <br /> <br />
Notes on usage:

The input file should contain both cds and protein sequences in order, separated by a newline, eg:


	>1
	ATGTGTAGAAGCTAGATCAGATCG
	>2
	ATGTGTAGTAGCTAGATCAGATCG

	>1
	MCRSLIRS
	>2
	MCSSLIRS

 

