#!/bin/bash

#archivo="/home/taller1/taller/vector1.txt"

#while IFS="," read -r linea
#do
#	echo "$linea"
#done < <(grep "," "$archivo")

declare -a v1=($(<$1/vector1.txt))
declare -a v2=($(<$1/vector2.txt))

a=(1 2 3 4 5)

#echo ${value[1]}

len=${#v1[@]}

sum=0

for ((i=0; i<len; i++))
do
	#echo -e "\n ${value[$i]}"
	sum=$(($sum + ${v1[$i]} + ${v2[$i]}))
done


touch $1/resultado.txt
echo $sum >> $1/resultado.txt
