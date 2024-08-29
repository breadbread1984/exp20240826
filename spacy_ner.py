#!/usr/bin/python3

from absl import flags, app
import json
import spacy

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input', default = None, help = 'path to into text')
  flags.DEFINE_string('output', default = 'output.json', help = 'path to output json')

def main(unused_argv):
  nlp = spacy.load("en_core_web_sm")
  with open(FLAGS.input, 'r') as f:
    doc = nlp(f.read())
  results = [(ent.text, ent.pos, ent.pos + len(ent.text)) for ent in doc.ents]
  with open(FLAGS.output, 'w') as f:
    f.write(json.dumps(results))

if __name__ == "__main__":
  add_options()
  app.run(main)
