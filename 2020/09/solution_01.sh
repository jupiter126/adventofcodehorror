#not sure why this worked :s
nnumbers=()
canary="0"

function f_testarray {
	for j in ${nnumbers[@]}; do
		for k in ${nnumbers[@]}; do
			if [[ "$j" = "$k" ]]; then continue; fi
			if [[ "$i" = $((j+k)) ]]; then return 0; fi
		done
	done
	if [[ "$canary" = "1" ]]; then echo $i; return 1; fi
}

for i in $(cat input.txt); do
#echo ${nnumbers[@]}
	if [[ "${#nnumbers[@]}" = "25" ]]; then
		f_testarray && nnumbers+=("$i"); nnumbers=("${nnumbers[@]:1}"); canary="1" || break
	elif [[ "${#nnumbers[@]}" -gt "25" ]]; then
		echo error; break;
	elif [[ "${#nnumbers[@]}" -lt "25" ]]; then
		nnumbers+=("$i")
	fi
done

