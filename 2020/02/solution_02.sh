vvalid=0
vvalid1=0
while IFS= read -r; do
        oone=$(echo "$REPLY"|cut -f1 -d' '|cut -f1 -d'-')
        ttwo=$(echo "$REPLY"|cut -f1 -d' '|cut -f2 -d'-')
	cchar=$(echo "$REPLY"|cut -f2 -d' '|sed -e 's/://g')
	ppass=$(echo "$REPLY"|cut -f3 -d' ')

function f_tish {
	pp1=$(echo "$ppass"| cut -b $oone)
	pp2=$(echo "$ppass"| cut -b $ttwo)
	if [[ "$pp1" != "$pp2" ]]; then
		if [[ "$pp1" = "$cchar" ]] || [[ "$pp2" = "$cchar" ]]; then
			vvalid=$((vvalid+1))
		fi
	fi
}

function f_jupi {
	firsttest=$(echo $ppass| head -c $oone | tail -c 1)
	secondtest=$(echo $ppass| head -c $ttwo | tail -c 1)
	if [[ "$firsttest" != "$secondtest" ]]; then
		if [[ "$firsttest" = "$cchar" ]] || [[ "$secondtest" = "$cchar" ]]; then
			vvalid1=$((vvalid1+1))
		fi
	fi
}

f_jupi
#f_tish

done <input.txt
echo "$vvalid"
echo "$vvalid1"
