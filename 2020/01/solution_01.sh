#!/bin/bash
array=($(cat input.txt))
for i in ${array[@]}; do
	for j in ${array[@]}; do
		if [[ "$((i+j))" = "2020" ]]; then echo "$((i*j))"; break 2; fi
#                if [[ $(echo "$i+$j"|bc) = "2020" ]]; then echo "$i*$j"|bc; break 2; fi
	done
done
