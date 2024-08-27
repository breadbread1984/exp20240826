#!/usr/bin/python3

import pickle
import wikipediaapi as wapi
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
  wiki = wapi.Wikipedia(user_agent = 'wikpediaapi', language = 'en')
  fp = open(FLAGS.output, 'w')
  open_list = list()
  close_list = set()
  for term in terms['properties']['terms']:
    page = wiki.page(term)
    if not page.exists():
      print(f'can\'t find term {term} on wikipedia!')
      continue
    categories = page.categories
    for title in sorted(categories.keys()):
      category_name = title.replace('Category:','')
      open_list.append((category_name, 1))
      add_non_term_node(fp, category_name)
  while (len(open_list)):
    node, d = open_list.pop(0)
    if node in close_list: continue
    close_list.add(node)
    category = wiki.page(f"Category:{node}")
    if not category.exists(): continue
    for category_or_term in category.categorymembers.values():
      if category_or_term.ns == wapi.Namespace.CATEGORY:
        subcategory = category_or_term
        category_name = subcategory.title.replace('Category:', '')
        if d < FLAGS.depth:
          open_list.append((category_name, d + 1))
        add_non_term_node(fp, category_name)
        add_edge(fp, node, category_name, 'cat_cat')
      if category_or_term.ns == wapi.Namespace.MAIN:
        page = category_or_term
        add_term_node(fp, page.title)
        add_edge(fp, node, page.title, 'cat_term')
  fp.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

