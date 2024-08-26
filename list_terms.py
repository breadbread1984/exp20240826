#!/usr/bin/python3

from absl import flags, app
import pickle
from chains import term_chain

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_enum('model', default = 'llama3', enum_values = {'llama3', 'qwen2'}, help = 'model')
  flags.DEFINE_integer('n', default = 50, help = 'how many terms')

def main(unused_argv):
  chain = term_chain(FLAGS.model)
  terms = chain.invoke({'quantity': '%d' % FLAGS.n,'field': 'sulfide electrolyte'})
  with open('terms.pkl', 'wb') as f:
    f.write(pickle.dumps(terms))

if __name__ == "__main__":
  add_options()
  app.run(main)

