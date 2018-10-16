#!/bin/bash

tmpfile=$(mktemp)

linenumber=`wc -l < /home/ubuntu/scripts_tcc/ansible/os_type`

if [[ "$linenumber" == 1 ]]; then
	while read line 
	do
	time=`cat /home/ubuntu/scripts_tcc/ansible/build_time | awk '{ print $2 }'`
	echo "${time}" > $tmpfile
	cat $tmpfile
	lower=`cat $tmpfile |awk '{ print $1 }'`
	system=`cat /home/ubuntu/scripts_tcc/ansible/build_time | awk '{ print $1 }'`
	done < /home/ubuntu/scripts_tcc/ansible/build_time
	
	
	echo "Fim de build e inicialização."
	echo "Você subiu um container com a imagem do ${system} e levou ${lower} segundos para isto."

	echo "Para iniciar este container, execute o seguinte comando na sua shell."
	echo "docker run -ti --entrypoint /bin/bash ${system}/rundeck"
	echo ""
	echo "Quando estiver dentro do container, utilize o comando para acessar os arquivos baixados e o clone do repositório clonado por você:"
	echo "cd /playbook"

else 
        while read line
        do
        time=`awk '{ print $2 }'`
        echo "${time[*]}" | sort -n | head -n1 > $tmpfile
        cat $tmpfile
        lower=`cat $tmpfile | head -1 |awk '{ print $1 }'`
        system=`grep -R $lower /home/ubuntu/scripts_tcc/ansible/build_time | head -1 | awk '{ print $1 }'`
        done < /home/ubuntu/scripts_tcc/ansible/build_time


	echo "Fim de build e inicialização."
	echo "O menor tempo de build foi utilizando a imagem do ${system} e levou ${lower} segundos."

	echo "Para iniciar o container que teve o tempo de build menor, execute o seguinte comando na sua shell."
	echo "docker run -ti --entrypoint /bin/bash ${system}/rundeck"
	echo ""
	echo "Quando estiver dentro do container, utilize o comando para acessar os arquivos baixados e o clone do repositório clonado por você:"
	echo "cd /playbook"
fi

rm $tmpfile
