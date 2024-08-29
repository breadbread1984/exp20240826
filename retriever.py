#!/usr/bin/python3

from absl import flags, app
from langchain.embeddings.huggingface import HuggingFaceEmbeddings
from langchain.vectorstores import Chroma


FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('db', default = 'vectordb', help = 'path to vectordb')
  flags.DEFINE_float('threshold', default = 0.5, help = 'threshold')
  flags.DEFINE_integer('max_words_per_entity', default = 3, help = 'maximum words for an entity')
  flags.DEFINE_string('input', default = None, help = 'path to input text')

def main(unused_argv):
  embeddings = HuggingFaceEmbeddings(model_name = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
  vectordb = Chroma(embedding_function = embeddings, persist_directory = FLAGS.db)
  retriever = vectordb.as_retriever(search_type = "similarity_score_threshold", search_kwargs = {"score_threshold": FLAGS.threshold})
  tokens = list()
  with open(FLAGS.input, 'r') as f:
    text = f.read()
    sentences = text.split('.,!?')
    for sentence in sentences:
      sentence_start_pos = text.find(sentence)
      words = sentence.split(' ')
      for n_words in range(1, FLAGS.max_words_per_entity + 1):
        for i in range(0, len(words), n_words):
          substring = ' '.join(words[i:i + n_words])
          matches = retriever.invoke(substring)
          if len(matches):
            token_start_pos = sentence.find(substring)
            tokens.append((substring, sentence_start_pos + token_start_pos))

if __name__ == "__main__":
  add_options()
  app.run(main)

