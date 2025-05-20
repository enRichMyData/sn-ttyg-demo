#!/bin/bash

# Directories
RAW_DIR="../raw"
RDF_DIR="../rdf"

# Ensure the output directory exists
mkdir -p "$RDF_DIR"

# Iterate over all JSON files in the /raw directory
for file in "$RAW_DIR"/*.json; do
  # Extract the base filename without extension
  filename=$(basename -- "$file")
  base="${filename%.*}"

  # Run the transformation command
  ontorefine-cli transform -u 'http://localhost:7333' -f json -q transform-query.sparql -c project-configurations.json "$file" > "$RDF_DIR/$base.ttl"

  # Log the transformation
  echo "Transformed $file to $RDF_DIR/$base.ttl"
done