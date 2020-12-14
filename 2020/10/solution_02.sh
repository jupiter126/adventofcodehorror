#not working, not even close...

# add a 0 in file for init state
cat input.txt |sort -n>input2.txt

j="0"
k="0"
l="0"
sscore="1"
for i in $(cat input2.txt); do
	if [[ "$j" = "0" ]]; then j="$i"; fi
	if [[ "$k" = "0" ]]; then k="$j"; j="$i"; fi
	if [[ "$l" = "0" ]]; then l="$k"; k="$j"; j="$i"; fi
	#init complete
	one="0";two="0";three="0"
	if [[ "$((i-l))" = "3" ]]; then one="1"; fi
#	if [[ "$((j-l))" -le "3" ]]; then two="1"; fi
	if [[ "$((k-l))" = "1" ]]; then three="1"; fi
	ssscore=$(echo "$one+$three"|bc)
	echo "$one $three $ssscore"
	sscore=$((sscore*ssscore))
	l="$k"; k="$j"; j="$i";
done
if [[ "$sscore" = "19208" ]]; then echo "method success: $sscore=19208"; else echo "method fail: $sscore != 19208"; fi
