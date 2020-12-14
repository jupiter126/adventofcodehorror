# This one works on example but not on data...
# 11884151942312 ==> what I need (I cheated to check)
# 9677107934398 too low
# 8207659936936 too low
# Works on test input but not on real one!
debug="0"
#inputfile="inputtest.txt"
inputfile="input.txt"
######
cat "$inputfile" |sed -e 's/ //g'>input2.txt
pad=$(printf '%0.1s' "0"{1..60})
memarray=()
theolength=$(grep mem "$inputfile" |cut -f1 -d'='|sort -u|wc -l)
totalsum=0

while read -r lline ; do
	value=$(echo "$lline" | cut -f2 -d'=')
	if   [[ $(echo "$value"|grep X) != "" ]]; then mask="$(echo $value)";  [ "$debug" = "1" ] && echo "mask $mask";bvalue=""; continue
	elif [[ $(echo "$lline"|grep "mem") != "" ]]; then
		address=$(echo "$lline"|cut -f2 -d'['|cut -f1 -d']')
		avalue="$(echo "obase=2; $value"|bc)"
		bvalue="$(printf '%*.*s%s' 0 $((36 - ${#avalue} )) "$pad" "$avalue")"
		[ "$debug" = "1" ] && echo "oldb $bvalue"
	else
		echo "bloody input: $lline"
	fi

#	if [[ "$oldmask" != "$mask" ]]; then bvalue="";fi

	if [[ "$bvalue" != "" ]]; then # apply mask on address
		if [[ "${#bvalue}" != "${#mask}" ]]; then echo "just checking..."; fi
		for bit in {1..36}; do
			if [[ "${mask:$bit:1}" = "0" ]]; then bvalue=$(echo $bvalue|sed "s/./0/$(($bit+1))"); fi
			if [[ "${mask:$bit:1}" = "1" ]]; then bvalue=$(echo $bvalue|sed "s/./1/$(($bit+1))"); fi
		done
		[ "$debug" = "1" ] && echo "newb $bvalue"
		memarray[$address]=$(echo "$((2#$bvalue))") # save value at address
		totalsum=$((totalsum+memarray[address]))
		bvalue=""
	fi
	oldmask="$mask"
done < input2.txt

[ $debug = "1" ] && echo "${memarray[@]}"

sum=$(IFS=+; echo "$((${memarray[*]}))")
y=0
for i in ${memarray[@]}; do
	y=$((y+i))
done

if [[ ${#memarray[@]} = $theolength ]]; then
	if [[ "$y" = "$sum" ]]; then
		echo "Number of elements in array and their sum match: Answer = $y"
	else
		echo "array sums don't match"
	fi
else
	echo "numbers of element in array don't match"
	echo "${#memarray[@]} != $theolength"
fi
echo "$totalsum"
