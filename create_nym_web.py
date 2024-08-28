#!/usr/bin/python3

import pickle
import wikipedia as wiki
from absl import app, flags

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('terms', default = 'terms.pkl', help = 'a list of terms')
  flags.DEFINE_integer('depth', default = 3, help = 'depth')
  flags.DEFINE_string('output', default = 'output.cypher', help = 'cypher script')

def add_term_node(fp, node):
  cypher = "merge (c: Term {text: \"%s\"}) return c;" % node
  fp.write(cypher + "\n")

def add_non_term_node(fp, node):
  cypher = "merge (c: Category {text: \"%s\"}) return c;" % node
  fp.write(cypher + "\n")

def add_edge(fp, node1, node2, mode = 'cat_term'):
  mode in {'cat_term', 'cat_cat'}
  typename = 'HAS_TERM' if mode == 'cat_term' else 'HAS_SUBCATEGORY';
  nodetype = 'Term' if mode == 'cat_term' else 'Category'
  cypher = "match (a: Category {text: \"%s\"}), (b: %s {text: \"%s\"}) merge (a)-[:%s]->(b);" % (node1, nodetype, node2, typename)
  fp.write(cypher + "\n")

def main(unused_argv):
  with open('terms.pkl', 'rb') as f:
    terms = pickle.loads(f.read())
  fp = open(FLAGS.output, 'w')
  open_list = list()
  close_list = set()
  for term in terms['properties']['terms']:
    try:
      page = wiki.page(term)
    except:
      print(f'can\'t find term {term} on wikipedia!')
      continue
    categories = [category for category in page.categories if len(category.split(' ')) <= 3]
    for category in sorted(categories):
      open_list.append((category, 1))
      add_non_term_node(fp, category)
  while (len(open_list)):
    category, d = open_list.pop(0)
    if category in close_list: continue
    close_list.add(category)
    try:
      page = wiki.page(f"Category:{category}")
    except:
      continue
    for term in page.links():
      add_term_node(fp, term)
      add_edge(fp, category, term, 'cat_term')
    for subcategory in [subcategory for subcategory in page.categories if len(subcategory.split(' ')) <= 3]:
      if d < FLAGS.depth:
        openlist.append((subcategory, d + 1))
      add_non_term_node(fp, category_name)
      add_edge(fp, category, subcategory, 'cat_cat')
  fp.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

