startbus=$(tail -n1 input.txt |cut -f1 -d',')
rrounds="$((100000000000000/$startbus))"
while true; do
	(( rrounds ++ ))
	starttime=$((startbus*rrounds))
	arrounds="0"
	for bbus in $(tail -n1 input.txt|sed -e 's/,/ /g'); do
		starttime="$((starttime+arrounds))"
		if   [[ "$bbus" = "x" ]]; then (( arrounds ++ )); continue;
		elif [[ "$((starttime%bbus))" = "0" ]]; then
#			if [[ "$bbus" != "$startbus" ]]; then
#				echo "$starttime $bbus"
#			fi
			(( arrounds ++ )); continue;
		else break
		fi
		echo "rounds=$rounds"; break 2
	done
done
