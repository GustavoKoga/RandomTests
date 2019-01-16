#!/bin/bash
# Executar como: bash [nome].sh [nomepasta] [nomearquivo.pl]
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in `find "$1" -type f`
do
  echo "$f"
  perl $2 "$f"
done
IFS=$SAVEIFS
