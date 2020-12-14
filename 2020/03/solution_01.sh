#removed first line of input.txt to make it work
trees=0
x=1
while IFS= read -r; do
	if [[ "$x" = 29 ]]; then x=1;
	elif [[ "$x" = 30 ]]; then x=2;
	elif [[ "$x" = 31 ]]; then x=3;
	else x=$((x+3))
	fi
	echo "$x"
        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
	if [[ "$istree" = "#" ]]; then
		trees=$((trees+1))
	fi
done <input.txt
echo "$trees"
