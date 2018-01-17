#!/bin/bash
echo "Enter model in idenifier form."
read MODEL
echo "Enter ECID in any form."
read ECID
echo "Enter versions, like this "8.0.2 "7.0.2" "7.0.3""
read VERSIONS
echo ok
for VERSION in "${VERSIONS[@]}"
do
	./tsschecker_macos -d $MODEL -e $ECID -s -i $VERSION
done
