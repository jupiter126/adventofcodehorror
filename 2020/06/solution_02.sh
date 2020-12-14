#reformat input.txt
sed -e ':a;N;$!ba;s/\(.\)\n/\1 /g' -e 's/\n/\n\n/' input.txt >input2.txt
sed -i '/^$/d' input2.txt

aanswers=0

while IFS= read -r; do
        array=($REPLY)
	grouprespondants="${#array[@]}"
	for cchar in {a..z}; do
		chartot=$(echo "${array[@]}" | awk -F"$cchar" '{print NF-1}')
		if [[ "$chartot" = "$grouprespondants" ]]; then
#			echo "yupee $cchar"
			aanswers=$((aanswers+1))
		fi
	done
done <input2.txt

echo $aanswers
