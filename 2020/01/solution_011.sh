#!/bin/bash
array=($(cat input.txt))
startnum="0"
while [[ "$startnum" -lt "200" ]]; do
 	i="${array[$startnum]}"
 	secondnum=$((startnum+1))
	while [[ "$secondnum" -lt "200" ]]; do
	 	j="${array[$secondnum]}"
		if [[ $(echo "$i+$j"|bc) = "2020" ]]; then echo "$i*$j"|bc;break 2; fi
		secondnum=$((secondnum+1))
	done
	startnum=$((startnum+1))
done
