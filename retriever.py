#!/usr/bin/python3

from absl import flags, app
from langchain.embeddings.huggingface import HuggingFaceEmbeddings
from langchain.vectorstores import Chroma


FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('db', default = 'vectordb', help = 'path to vectordb')
  flags.DEFINE_string('input', default = None, help = 'path to input text')

def main(unused_argv):
  embeddings = HuggingFaceEmbeddings(model_name = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
  vectordb = Chroma(embedding_function = embeddings, persist_directory = FLAGS.db)

