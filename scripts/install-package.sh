#!/bin/bash
# NOte cmd line variable is $1

if [ -n "$1" ]
then
	echo "Package to install is $1"
else
	echo "Package to install was not supplied"
	exit
fi

ansible all -b -m yum -a "name=$1 state=present"
