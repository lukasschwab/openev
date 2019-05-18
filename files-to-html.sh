for f in files/*
do
  echo "$f"
  pandoc -s "$f" -t html5 -o html_files/$(basename "$f").html --quiet
done
