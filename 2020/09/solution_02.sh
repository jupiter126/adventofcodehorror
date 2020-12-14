numberarray=($(cat input.txt))
target=105950735 # from part 1
startposition=0
foundit=0

while [[ "$foundit" = "0" ]]; do
	ssum="0"
	strlength=2
	position="$startposition"
	while [[ $strlength -le 50 ]]; do
		ssum=$((ssum+${numberarray[$position]}))
		if [[ "$ssum" = "$target" ]]; then
			foundit="1"; echo "$ssum ${numberarray[$position]} $startposition $strlength"; continue 2
		fi
		position=$((position+1)); strlength=$((strlength+1))
	done
	startposition=$((startposition+1))
done
