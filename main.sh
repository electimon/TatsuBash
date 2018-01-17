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
delcare -a os=linux
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
echo 'Enter versions, like this "8.0.2 "7.0.2" "7.0.3"'
read -a VERSIONS
echo ok

for VERSION in ${VERSIONS[@]}
do
	if [ $blobby = "y" ]
	then
	`find ./ -name tsschecker_$os` -s -i $VERSION -d $model -e $ecid 
done
else
echo "Not found, sad, getting now"
if [ $varq = y ]
then
echo "Not found, :("
sleep 1
echo "DLING, :)"
curl "https://github.com/electimon/TatsuBash/blob/master/tssfromrepo/tsschecker_linux?raw=true" > tsschecker
echo "Done"
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
        if [ $blobby = "y" ]
        then
        ./tsschecker -s -i $VERSION -d $model -e $ecid
done




fi

