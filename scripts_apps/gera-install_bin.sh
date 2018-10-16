#!/bin/bash

text=$@
#tempdir=$(mktemp -d /tmp/tmp.XXXXXXXX)

rm -f /home/ubuntu/scripts_tcc/dockerfiles/files_installation/bin-install

#recebe o repositório a clonar

if [ $# -ne 1 ]; then
  exit 0
fi



for f in $@; do
        echo "$f" >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/bin-install 
done

chmod +x /home/ubuntu/scripts_tcc/dockerfiles/files_installation/bin-install
