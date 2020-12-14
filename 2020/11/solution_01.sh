sed -e 's/L/1/g' -e 's/#/1/g' input.txt > input2.txt

declare -i row
declare -a newseatings
declare -a oldseatings
llines=$(wc -l input.txt|cut -f1 -d' ')

function f_initarray {
	line=1000
	while read -r ch ; do
		row=0
		rrow=1000
		while [ ! $row -eq ${#ch} ]; do
			newseatings[$line$rrow]="${ch:$row:1}"
#			echo "${newseatings[$line$rrow]}"
			(( row++ )) ; (( rrow ++ ))
		done
		(( line ++))
	done < input2.txt
}

function f_calcsquare {
	ttemp="$((line-1))$((rrow-1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && one="${oldseatings[$ttemp]}" || one="0"
	ttemp="$((line-1))$rrow"
	[ ! -z "${oldseatings[$ttemp]}" ] && two="${oldseatings[$ttemp]}" || two="0"
	ttemp="$((line-1))$((rrow+1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && three="${oldseatings[$ttemp]}" || three="0"
	ttemp="$line$((rrow-1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && four="${oldseatings[$ttemp]}" || four="0"
	ttemp="$line$rrow"
	five="${oldseatings[$ttemp]}"
	ttemp="$line$((rrow+1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && six="${oldseatings[$ttemp]}" || six="0"
	ttemp="$((line+1))$((rrow-1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && seven="${oldseatings[$ttemp]}" || seven="0"
	ttemp="$((line+1))$rrow"
	[ ! -z "${oldseatings[$ttemp]}" ] && eight="${oldseatings[$ttemp]}" || eight="0"
	ttemp="$((line+1))$((rrow+1))"
	[ ! -z "${oldseatings[$ttemp]}" ] && nine="${oldseatings[$ttemp]}" || nine="0"
	if [[ "$one" = "." ]]; then one="0";fi
	if [[ "$two" = "." ]]; then two="0";fi
	if [[ "$three" = "." ]]; then three="0";fi
	if [[ "$four" = "." ]]; then four="0";fi
	if [[ "$six" = "." ]]; then six="0";fi
	if [[ $seven = "." ]]; then seven="0";fi
	if [[ $eight = "." ]]; then eight="0";fi
	if [[ $nine = "." ]]; then nine="0";fi
#echo "$line $rrow $one $two $three $four $five $six $seven $eight $nine"
	neighbours=$(echo "$one+$two+$three+$four+$six+$seven+$eight+$nine"|bc)
#	echo $five
}

function f_copyarray {
	for idx in "${!newseatings[@]}"; do
	    oldseatings[$idx]=${newseatings[$idx]}
	done
#if [[ "${newseatings[$idx]}" = "${newseatings[$idx]}" ]]; then echo "arrays identical"; fi
}

function f_rebuildarray {
	f_copyarray
	line=1000
	while read -r ch ; do
		row="0"
		rrow="1000"
#		echo "line: $line"
		while [ ! $row -eq ${#ch} ]; do
			f_calcsquare
#			echo "$one+$two+$three+$four+$six+$seven+$eight+$nine"
			if [[ $five = "." ]]; then
				newseatings[$line$rrow]='.'
			elif [[ "$five" = "0" ]]; then
				if [[ "$neighbours" = "0" ]]; then
					newseatings[$line$rrow]="1"
				fi
			elif [[ "$five" = "1" ]]; then
				if [[ "$neighbours" -ge "4" ]]; then
					newseatings[$line$rrow]="0"
				fi
			fi
#			echo ${newseatings[$line$rrow]}
# exit
			(( row++ )) ; (( rrow ++ ))
		done
		(( line ++))
	done < input2.txt
	sleep 1
	echo "${newseatings[@]}"| sed -e 's/ //g' |fold -w98 > input2.txt
#	echo "${newseatings[@]}"| sed -e 's/ //g' |fold -w10 > input2.txt
	sleep 1
}

rround="1"
f_initarray
while [[ "${oldseatings[@]}" != "${newseatings[@]}" ]]; do
	echo "rround $rround"
	f_rebuildarray
#	echo "round done, ready for next?"
#	read aaa
#	if [[ "$aaa" != "Y" ]]; then exit;fi
	(( rround ++ ))
done
echo "${newseatings[@]}" | sed -e 's/ //g' |fold -w98 > solution1.txt
#echo "${newseatings[@]}" | sed -e 's/ //g' |fold -w10 > solution1.txt
echo "ANSWER IS:"
grep -o '1' input2.txt | wc -l
