#!/usr/bin/python3

from absl import flags, app
from neo4j import GraphDatabase
from langchain.embeddings.huggingface import HuggingFaceEmbeddings
from langchain.vectorstores import Chroma
from langchain_core.documents.base import Document

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'host')
  flags.DEFINE_string('username', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('output', default = 'vectordb_zy', help = 'path to output vectordb')

def main(unused_argv):
  driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.username, FLAGS.password))
  terms = set()
  for db in ['byllm', 'mner', 'wikift']:
    records, summary, keys = driver.execute_query('match (a) return a as term', database_ = db)
    for record in records:
      terms.add(record['term']['name'])
      if 'formula' in record['term']:
        terms.add(record['term']['formula'])
        if '-' in record['term']['formula']:
          mats = record['term']['formula'].split('-')
          if len(mats) == 2:
            terms.add('-'.join(mats[::-1]))
          for mat in mats:
            terms.add(mat)
  terms.add('LiCoO2')
  terms.add('Li3PO4')
  terms.add('Li4SnS4')
  terms.add('LiBH4')
  terms.add('Li1.3Al0.3Ti1.7(PO4)3')
  terms.add('Li1.3Al0.3-yByTi1.7(PO4)3')
  terms.add('Li1.3Al0.22-xB0.08InxTi1.7(PO4)3')
  terms.add('Li1.3Al0.22B0.08Ti1.7(PO4)3')
  terms.add('Li1.3Al0.21B0.08In0.01Ti1.7(PO4)3')
  terms.add('Lithium Aluminum Boron Titanium Phosphate')
  terms.add('Lithium Aluminum Boron Indium Titanium Phosphate')
  terms.add('hexamethyldisilazide magnesium chloride')
  terms.add('TFSI-bis(trifluoromethanesulfonyl)imide')
  terms.add('Mg(TFSI)2–MgCl2')

  embeddings = HuggingFaceEmbeddings(model_name = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
  vectordb = Chroma.from_documents(documents = [Document(page_content = term) for term in terms], embedding = embeddings, persist_directory = FLAGS.output)
  vectordb.persist()

if __name__ == "__main__":
  add_options()
  app.run(main)
