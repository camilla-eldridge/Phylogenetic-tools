- Generates an ML tree(bootstrap 1000) from cds sequence based on a protein alignment.
- Uses pal2nal to generate cds alignments based on protein alignments, Jmodel test to find best fitting substitution model and PhyML to make ML tree. 


Requirements in $PATH: trimal-v1.2, Clustalo.1.2.4, PhyML-3.1, Jmodeltest-2.1.10, pal2nal.pl


		USAGE:  ./protein_cds_tree_ml.sh  sequences.fasta 


Note: protein file and cds file must be named:

E.g

tor1.fasta
 

