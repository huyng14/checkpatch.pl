#!/bin/bash

input="./checkpatch-task1/no-merge.txt"
output="./checkpatch-task1/checkpatch-report-witherror"

rm -rf $output

declare -i count=1
declare -i total=`wc -l $input | awk -F " " '{print $1}'`

while read -r line
do
	files=`git diff-tree --no-commit-id --name-only -r $line`
	./scripts/checkpatch.pl --show-types $files 1>> $output 2>> $output
	((count++))
	unset files
	echo -e "$count/$total"
done < "$input"
