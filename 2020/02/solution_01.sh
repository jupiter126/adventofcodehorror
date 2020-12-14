vvalid=0
while IFS= read -r; do
        mmin=$(echo "$REPLY"|cut -f1 -d' '|cut -f1 -d'-')
        mmax=$(echo "$REPLY"|cut -f1 -d' '|cut -f2 -d'-')
	cchar=$(echo "$REPLY"|cut -f2 -d' '|sed -e 's/://g')
	ppass=$(echo "$REPLY"|cut -f3 -d' ')
	ccount=$(echo "$ppass" | tr -cd "$cchar" | wc -c)
	if [[ "$ccount" -ge "$mmin" ]] && [[ "$ccount" -le "$mmax" ]]; then
		vvalid=$((vvalid+1))
	fi
done <input.txt
echo "$vvalid"
