#!/bin/bash

input="./checkpatch-task1/no-merge.txt"
output="./checkpatch-task1/checkpatch-report-witherror"

#rm -rf $output

declare -i count=1
declare -i total=`wc -l $input | awk -F " " '{print $1}'`

awk 'NR > 0' $input |
while read -r line
do
	files=`git diff-tree --no-commit-id --name-only -r $line`
# check a commit that has any changed files or not
	if [ ! -z "$files" ]
	then
		./scripts/checkpatch.pl --show-types $files 1>> $output 2>> $output
	else
		echo -e "$line is empty\n" 1>> $output 2>> $output 
	fi
	
	unset files
	echo -e "$count/$total"
	((count++))
done
