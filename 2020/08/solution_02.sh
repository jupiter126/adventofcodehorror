#not working

accumulator="0"
lline="1"
llines=(0)
x=0

function f_execline {
#	echo "${#llines[@]}"
	if [[ "$lline" = "654" ]]; then echo "exit well: $accumulator"; fi
	if [[ ! -z $(printf '%s\n' "${llines[@]}" | grep -w $lline) ]]; then
		echo "accumulator=$accumulator"
		echo "${llines[@]}"
		x="1"
	else
		llines+=($lline)
	fi

	instr=$(sed "${lline}q;d" input2.txt)
	part1=$(echo "$instr"|cut -f1 -d' ')
	part2=$(echo "$instr"|cut -f2 -d' ')
	if [[ "$part1" = "acc" ]]; then
		accumulator=$(echo "$accumulator$part2"|bc)
		lline=$((lline+1))
	elif [[ "$part1" = "jmp" ]]; then
		lline=$(echo "$lline$part2"|bc)
	elif [[ "$part1" = "nop" ]]; then
		lline=$((lline+1))
	fi
}

while [[ "$x" = "0" ]]; do
	f_execline
done
