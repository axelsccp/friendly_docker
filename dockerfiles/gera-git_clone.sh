#!/bin/bash

text=$@

rm -f git_clone-download

#recebe o repositório a clonar

if [ -z "$1" ]
  then
    echo "Informe ao menos uma url para clone"
fi


for f in $@; do
	echo "git clone $f" >> git_clone-download
done

