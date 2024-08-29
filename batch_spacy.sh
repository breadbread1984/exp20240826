#!/bin/bash

rm -rf output_spacy
mkdir output_spacy

for f in documents/*.txt
do
	filename=`basename "$f"`
	python3 spacy_ner.py --input "$f" --output "output_spacy/$filename"
done
