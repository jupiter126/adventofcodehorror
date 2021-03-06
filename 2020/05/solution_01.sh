highestSID="0"
while IFS= read; do
        seatref=($REPLY)
	binexp1="64"; mmaxref1="127"; mminref1="0";binexp2="4" mmaxref2="7"; mminref2="0"
	for cchar in $(echo "$seatref"| sed -e 's/\(.\)/\1\n/g'); do
		if [[ "$cchar" = "B" ]]; then # upper
			mminref1=$((mminref1+binexp1)); binexp1=$((binexp1/2))
		elif [[ "$cchar" = "F" ]]; then # lower
			mmaxref1=$((mmaxref1-binexp1)); binexp1=$((binexp1/2))
		elif [[ "$cchar" = "R" ]]; then # upper
			mminref2=$((mminref2+binexp2)); binexp2=$((binexp2/2))
		elif [[ "$cchar" = "L" ]]; then # lower
			mmaxref2=$((mmaxref2-binexp2)); binexp2=$((binexp2/2))
		fi
	done
	seatID=$(echo "$mmaxref1*8+$mmaxref2"|bc)
#	echo "$seatref $seatID"
	if [[ "$seatID" -gt "$highestSID" ]]; then highestSID="$seatID"; fi

done <input.txt
echo "$highestSID"
