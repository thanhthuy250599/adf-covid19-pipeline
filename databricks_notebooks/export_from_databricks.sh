#!/bin/bash

# Export notebook từ Databricks Workspace về local
databricks workspace export \
  "/Users/uongthanhthuy99@gmail.com/clean_simple_covid" \
  "databricks_notebooks/clean_simple_covid.py" \
  --profile databricks-default \
  --format SOURCE
