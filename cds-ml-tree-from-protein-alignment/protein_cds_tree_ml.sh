#!/bin/bash
#$ set -e

sequences="$1"
name="${sequences%.*}"

sed '1,/^$/d' "$sequences"  > "$name"_prot.fasta
sed '/^$/q' "$sequences"  > "$name"_cds.fasta

clustalo -i "$name"_prot.fasta -o "$name"_clustalo.fasta --full --distmat-out="$name"_mat.txt --force --outfmt=fasta

pal2nal.pl "$name"_clustalo.fasta  "$name"_cds.fasta  > "$name"_pal2nal.fasta

trimal -in "$name"_pal2nal.fasta -out "$name".phylip -phylip -gt 0.9 -cons 60

java -jar ~/jmodeltest-2.1.10/jModelTest.jar -d "$name".phylip -g 4 -i -f -AIC -BIC -a -o "$name".jmodout

model="$(grep -A4 "::Best Models::" "$name".jmodout | tail -1 | cut -f2)"
x="$(echo "$model" | cut -f1 -d"+")"

if echo "$model" | grep -q "HKY";then
	~/PhyML-3.1/PhyML-3.1_linux64 -i "$name".phylip -m HKY85 -b 1000
elif echo "$model" | grep -q "JC";then
	~/PhyML-3.1/PhyML-3.1_linux64 -i "$name".phylip -m JC69 -b 1000
else
	~/PhyML-3.1/PhyML-3.1_linux64 -i "$name".phylip  -m "$x" -b 1000
fi
