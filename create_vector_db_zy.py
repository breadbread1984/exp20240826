#!/usr/bin/python3

from os.path import join
import json
from langchain.embeddings.huggingface import HuggingFaceEmbeddings
from langchain.vectorstores import Chroma
from langchain_core.documents.base import Document

terms = set()
with open(join('zhaoying_graph_db', 'byllm.json'), 'r', encoding = 'utf-8-sig') as f:
  graph = json.loads(f.read())
  for relation in graph:
    terms.add(relation['a']['properties']['name'])
    terms.add(relation['b']['properties']['name'])
with open(join('zhaoying_graph_db', 'mner.json'), 'r', encoding = 'utf-8-sig') as f:
  graph = json.loads(f.read())
  for relation in graph:
    terms.add(relation['a']['properties']['name'])
    terms.add(relation['b']['properties']['name'])
with open(join('zhaoying_graph_db', 'wikift.json'), 'r', encoding = 'utf-8-sig') as f:
  graph = json.loads(f.read())
  for relation in graph:
    terms.add(relation['a']['properties']['name'])
    terms.add(relation['b']['properties']['name'])
embeddings = HuggingFaceEmbeddings(model_name = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
vectordb = Chroma.from_documents(documents = [Document(page_content = term) for term in terms], embedding = embeddings, persist_directory = 'vectordb_zy')
vectordb.persist()
