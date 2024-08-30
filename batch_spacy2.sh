#!/bin/bash

rm -rf output_spacy2
mkdir output_spacy2

for f in documents/*.txt
do
	filename=`basename "$f"`
	python3 spacy_ner2.py --input "$f" --output "output_spacy2/$filename"
done
