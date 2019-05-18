#!/bin/bash
for f in files/*.docx # Pandoc only handles docx.
do
  echo "$f"
  pandoc -s "$f" -t html5 -o html_files/$(basename "$f").html --quiet
done
