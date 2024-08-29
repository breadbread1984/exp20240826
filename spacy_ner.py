#!/usr/bin/python3

from absl import flags, app
import json
import spacy

FLAGS = flags.FLAGS

def add_option():
  flags.DEFINE_string('input', default = None, help = 'path to into text')

def main(unused_argv):
  nlp = spacy.load("en_core_web_sm")
  with open(FLAGS.input, 'r') as f:
    tokens = nlp(f.read())
  results = [(token[0], token[1], token[1] + len(token[0])) for token in tokens]
  with open(FLAGS.output, 'w') as f:
    f.write(json.dumps(results))

if __name__ == "__main__":
  add_options()
  app.run(main)
