#!/bin/bash

THRESHOLD=0.5

rm -rf output
mkdir output

for f in documents/*.txt
do
	python3 retriever.py --db vectordb --threshold $THRESHOLD --input "$f" --output output/`basename "$f"`
done

