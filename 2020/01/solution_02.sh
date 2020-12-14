#!/bin/bash
array=($(cat input.txt))
for i in ${array[@]}; do
	for j in ${array[@]}; do
		for k in ${array[@]}; do
			if [[ "$((i+j+k))" = "2020" ]] && [[ "$i" != "$j" ]] && [[ "$j" != "$k" ]] && [[ "$i" != "$k" ]]; then echo "$((i*j*k))"; break 3; fi
		done
	done
done
