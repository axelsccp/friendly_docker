#!/bin/bash

text=$@

rm -f /home/ubuntu/scripts_tcc/dockerfiles/files_installation/git_clone-download 

#recebe o repositório a clonar

if [ $# -ne 1 ]; then
  exit 0
fi


for f in $@; do
	echo "git clone $f" >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/git_clone-download
done

chmod +x /home/ubuntu/scripts_tcc/dockerfiles/files_installation/git_clone-download 
