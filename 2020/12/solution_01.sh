#not working - solves example but not real data
# not 294
# not 897
########
inputfile="input.txt"
offset=0  # avoid being negative ???
x="$offset"
y="$offset"
direction=1 #east=1, south=2, west=3, north=4


function f_caliber_compass {
	if [[ "$direction" < "1" ]]; then direction=$((direction+4));
	elif [[ "$direction" > "4" ]]; then direction=$((direction-4));
	fi
	if [[ "$direction" < "1" ]] || [[ "$direction" > "4" ]]; then echo "gps broken"; fi
}

function f_forward {
	if   [[ "$direction" = "1" ]]; then x=$((x+movement));
	elif [[ "$direction" = "2" ]]; then y=$((y-movement));
	elif [[ "$direction" = "3" ]]; then x=$((x-movement));
	elif [[ "$direction" = "4" ]]; then y=$((y+movement));
	fi
}

for lline in $(cat "$inputfile"); do
	echo "$instruc $movement $direction $x $y" # debug info
	instruc="";movement="";
	instruc=$(echo $lline|sed -e 's/[0-9]//g')
	movement=$(echo $lline|sed -e 's/[A-Z]//g')
	if [[ "$instruc" = "" ]] || [[ "$movement" = "" ]]; then echo "bastard";
	elif [[ "$instruc" = "N"  ]]; then y=$((y+movement));
	elif [[ "$instruc" = "S"  ]]; then y=$((y-movement));
	elif [[ "$instruc" = "E"  ]]; then x=$((x+movement));
	elif [[ "$instruc" = "W"  ]]; then x=$((x-movement));
	elif [[ "$instruc" = "R"  ]]; then direction=$(echo "$direction+($movement/90)"|bc);f_caliber_compass;
	elif [[ "$instruc" = "L"  ]]; then direction=$(echo "$direction-($movement/90)"|bc);f_caliber_compass;
	elif [[ "$instruc" = "F"  ]]; then f_forward;
	else echo "$instruc $movement"
	fi
done
echo "Solution: $x $y"
echo "sqrt(($x-$offset)^2)+sqrt(($y-$offset)^2)"|bc
