#!/usr/bin/python3

from absl import flags, app
import pickle
from chains import entity_chain

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_enum("model", default = 'llama3', enum_values = {'llama3', 'qwen2'}, help = 'model')
  flags.DEFINE_string('input', default = None, help = 'path to into text')
  flags.DFEINE_string('output', default = 'output.pkl', help = 'path to output pickle file')

def main(unused_argv):
  chain = entity_chain(FLAGS.model)
  with open(FLAGS.input, 'r') as f:
    entities = chain.invoke({'text': f.read()})
  with open(FLAGS.output, 'wb') as f:
    f.write(pickle.dumps(entities))

if __name__ == "__main__":
  add_options()
  app.run(main)

