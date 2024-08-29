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
  flags.DEFINE_string('database', default = 'neo4j', help = 'database')
  flags.DEFINE_string('output', default = 'vectordb', help = 'path to output vectordb')

def main(unused_argv):
  driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.username, FLAGS.password))
  records, summary, keys = driver.execute_query('match (a: Term) return a as term', database_ = FLAGS.database)
  terms = [record['term']['text'] for record in records]
  embeddings = HuggingFaceEmbeddings(model_name = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
  vectordb = Chroma(documents = [Document(page_content = term) for term in terms], embedding_function = embeddings, persist_directory = FLAGS.output)
  vectordb.persist()

if __name__ == "__main__":
  add_options()
  app.run(main)

