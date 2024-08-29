#!/usr/bin/python3

from typing import List
from langchain_core.pydantic_v1 import BaseModel, Field
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts.prompt import PromptTemplate

def get_terms_template(tokenizer):
  class Terms(BaseModel):
    terms: List[str] = Field('a list of {quantity} most popular professional terms in field of {field}.')
  parser = JsonOutputParser(pydantic_object = Terms)
  instructions = parser.get_format_instructions()
  instructions = instructions.replace('{','{{')
  instructions = instructions.replace('}','}}')
  user_prompt = "Please list {quantity} most popular professional terms in the field of {field}. \n\n%s" % instructions
  messages = [
    {'role': 'user', 'content': user_prompt},
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_vairables = ['quantity', 'field'])
  return template, parser

def get_entity_template(tokenizer):
  class Entities(BaseModel):
    entities: List[str] = Field('a list of entities.')
  parser = JsonOutputParser(pydantic_object = Entities)
  instructions = parser.get_format_instructions()
  instructions = instructions.replace('{','{{')
  instructions = instructions.replace('}','}}')
  system_message = "Extract entities from the user given text. \n\n%s" % instructions
  messages = [
    {'role': 'system', 'content': system_message},
    {'role': 'user', 'content': "{text}"}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['text'])
  return template
