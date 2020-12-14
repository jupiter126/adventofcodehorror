#!/bin/bash
array=($(cat input.txt))
pi="0"
while [[ "$pi" -lt ${#array[@]} ]]; do
	i="${array[$pi]}"
	pj="$((pi+1))"
	while [[ "$pj" -lt ${#array[@]} ]]; do
		j="${array[$pj]}"
		pk="((pj+1))"
		while [[ "$pk" -lt ${#array[@]} ]]; do
			k="${array[$pk]}"
			if [[ "$((i+j+k))" = "2020" ]] && [[ "$i" != "$j" ]] && [[ "$j" != "$k" ]] && [[ "$i" != "$k" ]]; then echo "$((i*j*k))"; break 3; fi
			(( pk ++ ))
		done
		(( pj ++ ))
	done
	(( pi ++ ))
done
