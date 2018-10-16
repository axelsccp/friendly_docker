#!/bin/bash

text=$@

rm -f wget-download 

#recebe o repositório a clonar

if [ -z "$1" ]
  then
    echo "Informe ao menos uma url para clone"
fi


for f in $@; do
	echo "wget $f -P $#-1" >> wget-download
done

