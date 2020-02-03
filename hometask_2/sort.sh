#!/bin/bash
if ! [ -f versions.txt ];
then
wget http://yoko.ukrtux.com:8899/versions.txt
fi
sort -V versions.txt >> versions1.txt
cat versions1.txt > versions.txt
rm versions1.txt
cat versions.txt

