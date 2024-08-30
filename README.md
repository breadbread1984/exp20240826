# Introduction

the experimental code

# Usage

## list technical terms in field of sulfide electrolyte

```shell
python3 list_terms.py --n <how many terms> --model (llama3|qwen2)
```

## create term web

```shell
python3 create_nym_web.py --output <path/to/output/cypher>
```

import graph database into neo4j

```shell
cat output.cypher | cypher-shell -a <host> -u <username> -p <password> -d <database>
```

## create vectordb

### create vectordb from wiki extracted terms

```shell
python3 create_vector_db.py --host <host> --username <username> --password <password> --database <database> --output <path/to/vectordb>
```

## create vectordb from Zhao Ying extracted terms

```shell
echo "create database byllm; create database mner; create database wikift;" | cypher-shell -a bolt://localhost:
7687 -u neo4j -p neo4j -d neo4j
cat zhaoying_graph_db/byllm.cypher | cypher-shell -a bolt://localhost:7687 -u neo4j -p neo4j -d byllm
cat zhaoying_graph_db/mner.cypher | cypher-shell -a bolt://localhost:7687 -u neo4j -p neo4j -d mner
cat zhaoying_graph_db/wikift.cypher | cypher-shell -a bolt://localhost:7687 -u neo4j -p neo4j -d wikift
python3 create_vector_db_zy.py
```

| prebuilt vectordb | url |
|-------------------|-----|
| vectordb.tar.gz   | https://drive.google.com/file/d/1Eqnu5dr0ovmzVSdLzsu7hM6AcPAJY34_/view?usp=sharing |
| vectordb_zy.tar.gz | https://drive.google.com/file/d/1z1xeZROZ9G0U0zgU7qu8C4PqecwROAma/view?usp=sharing |

## retrieve key words from text

```shell
bash batch_retriever.sh
bash batch_retriever_zy.sh
```

the output files are under directory ***output***.

## spacy NER from text

```shell
bash batch_spacy.sh
```

the output files are under directory ***output_spacy***

## extract all entities from text

```shell
bash batch_entities.sh
```
