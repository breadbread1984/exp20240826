#!/bin/bash

THRESHOLD=0.5

rm -rf output_zy
mkdir output_zy

for f in documents/*.txt
do
	filename=`basename "$f"`
	python3 retriever.py --db vectordb_zy --threshold $THRESHOLD --input "$f" --output "output_zy/$filename"
done

