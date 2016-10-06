#!/bin/bash

PROJECTPATH=$GOPATH/src/$1

cd $PROJECTPATH

ROUTES=$(grep -r 'option (limbo.http)' $GOPATH/src/github.com/mrhenry/cfda-api/*)

for r in $ROUTES
do

	if [ $r == "=" ]; then
		continue
	fi

	if [ $r == "option" ]; then
		continue
	fi

	if [[ $r == \"* ]]; then
		ROUTE=(${r//\"/ })
		echo \*\*$METHOD\*\*  \`${ROUTE[0]}\`
		echo ""
	fi

	if [[ $r == \(limbo.http\)* ]]; then
		LIMBO=(${r//./ })
		LOWER=${LIMBO[2]}
		METHOD=$(echo $LOWER | tr '[a-z]' '[A-Z]')
	fi

done
