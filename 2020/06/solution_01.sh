#reformat input.txt
sed -e ':a;N;$!ba;s/\(.\)\n/\1 /g' -e 's/\n/\n\n/' input.txt >input2.txt
sed -i '/^$/d' input2.txt
sed -i 's/ //g' input2.txt
sed 's/\B/\n/g;s/.*/echo "&"|sort -u/e;s/\n//g' input2.txt>input3.txt

ttotal=0
while IFS= read; do
	ccount=$(echo -n "$REPLY"|wc -c)
	ttotal=$((ttotal+ccount))
done <input3.txt
echo "$ttotal"
