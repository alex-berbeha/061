#!/bin/bash
if ! [ -d $2 ];
then
mkdir -p $2
fi
list=(`find $1 -maxdepth 1 -mtime -1`)
len=${#list[@]}
for (( i=1; i<(($len+1)); i++ ))
do
    if ! [ -d $2`date +%Y%m%d` ];
    then
        mkdir -p $2`date +%Y%m%d`
    fi
    rsync -r ${list[$i]} $2`date +%Y%m%d`
done
