#!/bin/bash
echo "Debug? y,n"
read varq
echo "Save blobs? y,n"
read blobby
echo "Detecting os"
if [[ $(uname) = "Darwin" ]]
then
if [ $varq = y ]
then
echo MacOS
fi
declare -a os=macos
fi
if [[ $(uname -s) = "Linux" ]]
then
if [ $varq = y ] 
then
echo Linux
fi
declare -a os=linux
fi
if [ $varq = y ] 
then
echo "Searching for tsschecker in directory..."
fi
if [[ $(find ./ -name tsschecker_$os) = "tsschecker_$os" ]]
then
echo "Enter model in idenifier form."
read -a model
echo "Enter ECID in any form."
read -a ecid
echo 'Enter version'
read -a VERSIONS
echo ok

#for VERSION in ${VERSIONS[@]}
#do
	if [ $blobby = "y" ]
	then
	`find ./ -name tsschecker_$os` -s -i $VERSIONS -d $model -e $ecid 
	fi
	`find ./ -name tsschecker_$os` -i $VERSIONS -d $model -e $ecid
#done
else
if [ `find ./ -name tsschecker*$os` = tsschecker*$os ]] || if [ `find ./ -name tsschecker` = tsschecker ]
then
echo "Enter model in idenifier form."
read -a model
echo "Enter ECID in any form."
read -a ecid
echo 'Enter versions, like this "8.0.2 "7.0.2" "7.0.3"'
read -a VERSIONS
echo ok
chmod +x tsschecker

#for VERSION in ${VERSIONS[@]}
#do
        if [ $blobby = "y" ]
        then
        ./tsschecker -s -i $VERSIONS -d $model -e $ecid
        fi
        ./tsschecker -i $VERSIONS -d $model -e $ecid
fi
fi
echo "Tsschecker not found, sad, getting now"
if [ $varq = y ]
then
echo "Not found, :("
sleep 1
echo "DLING, :)"
fi
curl "https://raw.githubusercontent.com/electimon/TatsuBash/master/tssfromrepo/tsschecker_$os" > tsschecker
if [ $varq = "y" ]
then
echo "Done"
fi
echo "Enter model in idenifier form."
read -a model
echo "Enter ECID in any form."
read -a ecid
echo 'Enter versions, like this "8.0.2 "7.0.2" "7.0.3"'
read -a VERSIONS
echo ok
chmod +x tsschecker

#for VERSION in ${VERSIONS[@]}
#do
        if [ $blobby = "y" ]
        then
        ./tsschecker -s -i $VERSIONS -d $model -e $ecid
	fi
	./tsschecker -i $VERSIONS -d $model -e $ecid
#done

