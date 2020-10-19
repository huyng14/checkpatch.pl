#!/bin/bash

input="result/statistics.txt"
other="result/other.txt"
small="result/small_number_errors.txt"
big="result/large_number_errors.txt"

declare -i number_errors=0
declare -i count=0

while read -r line
do
	number_errors=`echo $line | awk '{print $2}'`
	if [ $number_errors -eq '0' ]
	then
		echo -e "$line" >> $other
	else
		if [ $number_errors -lt '10' ]
		then
			count+=$number_errors
			echo -e "$line" >> $small
		else
			echo -e "$line" >> $big
		fi
	fi
done < $input

echo -e "Total: $count" >> $small
