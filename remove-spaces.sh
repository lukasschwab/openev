cd files;
for f in *\ *; do mv "$f" "${f// /_}"; done
