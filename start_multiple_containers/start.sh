#!/bin/bash

PROGNAME=$0

IFS=' '
set -f
if [ $# -ne 1 ]
  then
        echo "usage: $name -f FLAVOUR
#where:
#  - FLAVOUR is one of the linux distributions (debian, centos, ubuntu, opensus), e.g., if you want to start all of them, then you must use 'all'. If you want to start just one or more of the list, you should specify it, -f debian centos... or whatever."
	exit 1
fi

#usage() { echo "Usage: $0 [-f <flavour>] [-g <git_url>] [-u <url de download>] [-b <binários>] " 1>&2; exit 1; }
#while getopts ":f:g:u:b:" o; do
#  case $o in
#    (f) FLAVOURS="$OPTARG";;
#    (g) GITURL=($OPTARG);;
#    (u) DOWNLOAD=($OPTARG);;
#    (b) BINARIOS=($OPTARG);;
#    (*) usage;;
#  esac
#done
#shift "$((OPTIND - 1))"

FLAVOURS=$1

#if [ -z "${FLAVOURS}" ] ; then
#    echo "É necessário que seja informado um tipo de imagem a ser criada"
#fi

version=latest
debian=debian:${version}
centos=centos:${version}
ubuntu=ubuntu:${version}
fedora=fedora:${version}
#FLAVOURS=$@

# Name the container and the volume after the command line arguments, which we
# simply concatenate and replace the invalid characteres with _, accorging to
# Docker's requirements: https://stackoverflow.com/a/42642992

#name=gp$(echo $* | tr -c 'A-Za-z0-9_.-' '[_*]')

#set -x

echo $FLAVOURS

#for f in "${GITURL[@]}"; do
#	echo -n "git ${f}\n"
#done
#printf "\b \n"

for f in "${DOWNLOAD[@]}"; do
        echo -n "download ${f},"
done
printf "\b \n"

for f in "${BINARIOS[@]}"; do
        echo -n "bin ${f},"
done
printf "\b \n"

if [ $FLAVOURS == 'all' ]; then
	for image in $debian $centos $ubuntu $fedora; do
		docker pull $image
	done
        echo "debian
centos
ubuntu
fedora" > /home/ubuntu/scripts_tcc/ansible/os_type 
fi

if [ $FLAVOURS == 'debian' ]; then
        for image in $debian; do
                docker pull $image
        done
        echo "debian" > /home/ubuntu/scripts_tcc/ansible/os_type 
fi

if [ $FLAVOURS == 'centos' ]; then
        for image in $centos; do
                docker pull $image
        done
        echo "centos" > /home/ubuntu/scripts_tcc/ansible/os_type
fi

if [ $FLAVOURS == 'ubuntu' ]; then
        for image in $ubuntu ; do
                docker pull $image
        done
        echo "ubuntu" > /home/ubuntu/scripts_tcc/ansible/os_type
fi

if [ $FLAVOURS == 'fedora' ]; then
        for image in $fedora; do
                docker pull $image
        done
        echo "fedora" > /home/ubuntu/scripts_tcc/ansible/os_type
fi

#docker run \
#       -d \
#       --name $name \
#       -v $name:/home/cpqdgp/installation \
#       -p 8080:8080 \
#       -p 9990-9999:9990 \
#       -e HOST_IP=`hostname | awk -F"ip-" '{ print $NF }' | sed 's/-/./g'` \
#       $image \
#       "$@"

#docker logs -f $name
