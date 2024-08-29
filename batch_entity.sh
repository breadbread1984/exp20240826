#!/bin/bash

rm -rf entities
mkdir entities

for f in documents/*.txt
do
	filename=`basename "$f"`
	python3 list_entities.py --input "$f" --output "entities/$filename"
done
