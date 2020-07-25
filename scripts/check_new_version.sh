#!/bin/bash

vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

LATEST=`curl -sL https://api.github.com/repos/hashicorp/terraform-cdk/releases/latest | jq -r '.tag_name' | tr -d "v"`

echo LATEST: $LATEST 
echo CURRENT: $CDKTF_VERSION

vercomp $LATEST $CDKTF_VERSION

COMP_RESULT=$?

if [ "${COMP_RESULT}" == "0" ];
then
	echo "*** Versions are the same. No changes."
	exit 0
fi

if [[ $COMP_RESULT == 1 ]];
then
	echo "*** New version available"

	echo "::set-output name={new_version_available}::{$LATEST}"
	exit 0
fi

if [[ $COMP_RESULT == 2 ]];
then
	echo "Problem..."
	exit 1
fi

