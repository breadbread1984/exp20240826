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

```shell
python3 create_vector_db.py --host <host> --username <username> --password <password> --database <database> --output <path/to/vectordb>
```

| prebuilt vectordb | url |
|-------------------|-----|
| vectordb.tar.gz   | https://drive.google.com/file/d/1Eqnu5dr0ovmzVSdLzsu7hM6AcPAJY34_/view?usp=sharing |

