#!/bin/bash

text=$@
#tempdir=$(mktemp -d /tmp/tmp.XXXXXXXX)

rm -f /home/ubuntu/scripts_tcc/dockerfiles/files_installation/wget-download

#recebe o repositório a clonar

if [ $# -ne 1 ]; then
  exit 0
fi


for f in $@; do
	echo "wget $f " >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/wget-download
done

chmod +x /home/ubuntu/scripts_tcc/dockerfiles/files_installation/wget-download
