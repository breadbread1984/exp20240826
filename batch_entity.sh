#!/bin/bash

rm -rf entities
mkdir entities

for f in documents/*.txt
do
	filename=`basename "$f"`
	python3 list_entities.py --model qwen2 --input "$f" --output "entities/$filename".pkl
done
