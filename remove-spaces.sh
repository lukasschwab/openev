#!/bin/bash
for f in files/*\ *; do mv "$f" "${f// /_}"; done
