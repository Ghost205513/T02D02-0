#!/bin/bash

echo 'Enter path to file:'
read path
if [ -f "$path" ] && [[ $path = /* ]]
then
    echo 'Enter string to replace:'
    read old_str
    if grep -q "$old_str" $path
    then
        echo 'Enter replaced string:'
        read new_str
        touch temp
        sed -i '' 's/'$old_str'/'$new_str'/' $path
        echo "$path - $(ls -l $path | tr -s ' ' | cut -d ' ' -f 5) - $(date -r $path +'%F %R') - $(shasum -a 256 $path | cut -d ' ' -f 1) - sha256" >> files.log
    else
        echo 'No such string in the file'
    fi
else
    echo 'Wrong path to file'
fi
