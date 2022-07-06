#!/bin/bash

echo 'Enter path to file:'
read path
if [ -f "$path" ] && [[ $path = /* ]]
then
    #IFS=$'\n'
    echo "$(cat $path | wc -l) $(cat $path | tr -s ' ' | cut -d ' ' -f 1 | uniq | wc -l) $(cat $path | tr -s ' ' | cut -d ' ' -f 8 | uniq | wc -l)"
else
    echo 'Wrong path to file'
fi
