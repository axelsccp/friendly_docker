#setopt shwordsplit      # this can be unset by saying: unsetopt shwordsplit
unset $@
text=$@


rm -f /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-install 
rm -f /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-roles

#recebe o repositório a clonar

if [ $# -ne 1 ]; then
  exit 1
fi


echo '- hosts: all' >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-install
echo '  roles:' >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-install

for f in $@; do
    echo "ansible-galaxy install geerlingguy.$f" >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-roles
    echo "  - geerlingguy.$f" >> /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy-install
done

chmod +x /home/ubuntu/scripts_tcc/dockerfiles/files_installation/ansible-galaxy*
