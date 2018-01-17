#!/bin/bash
echo "Detecting os"
if [[ $(uname) = "Darwin" ]]
then
echo MacOS
declare -a 
fi
if [[ $(uname -s) = "Linux" ]]
then
echo Linux
fi
echo "Enter model in idenifier form."
read -a model
echo "Enter ECID in any form."
read -a ecid
echo 'Enter versions, like this "8.0.2 "7.0.2" "7.0.3"'
read -a VERSIONS
echo ok

for VERSION in ${VERSIONS[@]}
do
	echo hi
done
