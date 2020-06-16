#!/bin/bash
#
# https://github.com/a2u/gh-repos
#
#####################################################################################

larray=(php javascript python)

echo -n "What language(s) do you need to get: "
read lang

IFS=',' read -r -a array <<< "$lang"
for language in "${array[@]}"
do
    if [[ ! " ${larray[@]}" =~ ${language} ]]; then
        echo "Language \"$language\" is not available. Skipping."
    else
        if ! command -v curl > /dev/null 2>&1; then
            printf "cURL is not installed or accessible. Install cURL to use this.\n"
            exit
        else
            tmpfile=`mktemp`
            curl -L https://codeload.github.com/a2u/gh-repos/zip/${language} -o ${tmpfile}
        fi
    fi
done