#!/bin/bash
ARQUIVO=$1;
REFERENCIA=$2;

if [ -z "$ARQUIVO" ]; then
	echo "Arquivo null"
elif [ -z "$REFERENCIA" ]; then
	echo "Referencia null"
else 
	echo "else"
fi

if [ -e "$ARQUIVO" ]; then
	echo "Arquivo existe"
else
	echo "Arquivo não existe"
fi
