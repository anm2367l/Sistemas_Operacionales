#!/bin/bash

mkdir $1
touch $1/vector1.txt 
touch $1/vector2.txt

v1=(1 2 3 4 5) 
v2=(6 7 8 9 10) 

#echo ${v1[*]}

echo ${v1[*]} >> $1/vector1.txt
echo ${v2[*]} >> $1/vector2.txt
