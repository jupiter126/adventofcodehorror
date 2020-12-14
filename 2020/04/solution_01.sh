#reformat input.txt
sed -e ':a;N;$!ba;s/\(.\)\n/\1 /g' -e 's/\n/\n\n/' input.txt >input2.txt
sed -i '/^$/d' input2.txt

vvalid="0"
while IFS= read; do
        passport=($REPLY)
	if [[ "${#passport[@]}" = "8" ]]; then
		vvalid=$((vvalid+1));
	elif [[ "${#passport[@]}" = "7" ]]; then
		if [[ $(echo "${passport[@]}" | grep 'cid:') = "" ]]; then
			vvalid=$((vvalid+1));
#		else echo "not valid";
		fi
#	elif [[ "${#passport[@]}" -lt "7" ]]; then
#		echo "not valid"
	fi
done <input2.txt
echo "$vvalid"
