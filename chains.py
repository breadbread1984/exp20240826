#!/usr/bin/python3

from models import Llama3, Llama3_FA2, Qwen2, Qwen2_FA2
from prompts import get_terms_template, get_entity_template

def term_chain(model = 'llama3'):
  model = {
    'llama3': Llama3_FA2,
    'qwen2': Qwen2_FA2
  }[model]
  tokenizer, llm = model(True)
  prompt, parser = get_terms_template(tokenizer)
  chain = prompt | llm | parser
  return chain

def entity_chain(model = 'llama3'):
  model = {
    'llama3': Llama3_FA2,
    'qwen2': Qwen2_FA2
  }[model]
  tokenizer, llm = model(True)
  prompt, parser = get_entity_template(tokenizer)
  chain = prompt | llm | parser
  return chain
