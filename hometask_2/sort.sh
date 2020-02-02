#!/bin/bash
if ! [ -f versions.txt ];
then
wget http://yoko.ukrtux.com:8899/versions.txt
fi
sort -V versions.txt
