# not 2176 (off by one)
# not 2208 (off by three)
cat input.txt |sort -n>input2.txt

oone="1"
two="0"
three="1"
j="0"
for i in $(cat input2.txt); do
	if [[ "$j" = "0" ]]; then j="$i"; echo init1; continue
	elif [[ "$((i-j))" = "1" ]]; then oone="$((oone+1))";j="$i";continue
	elif [[ "$((i-j))" = "2" ]]; then two="$((two+1))";j="$i";continue
	elif [[ "$((i-j))" = "3" ]]; then three="$((three+1))";j="$i";continue
	else echo "error"
	fi
done
echo "one: $oone  -  two: $two  -  three: $three"
echo "$oone*$three"|bc
