## NOT WORKING

#reformat input.txt
sed -e ':a;N;$!ba;s/\(.\)\n/\1 /g' -e 's/\n/\n\n/' input.txt >input2.txt
sed -i '/^$/d' input2.txt

vvalid="0"
while IFS= read -r; do
        passport=($REPLY)
	if [[ "${#passport[@]}" -ge "9" ]]; then echo "bastard"; continue; fi
	if [[ "${#passport[@]}" -ge "7" ]]; then
		for ddata in ${passport[@]}; do
			nname=$(echo $ddata|cut -f1 -d':')
			ccont=$(echo $ddata|cut -f2 -d':')
			if [[ "$nname" = "byr" ]]; then
				if [[ "$(echo -n $ccont|wc -c)" != "4" ]]; then continue 2; fi
				if [[ "$ccont" -lt "1920" ]] || [[ "$ccont" -gt "2002" ]]; then continue 2; fi
			elif [[ "$nname" = "iyr" ]]; then
				if [[ "$(echo -n $ccont|wc -c)" != "4" ]]; then continue 2; fi
				if [[ "$ccont" -lt "2010" ]] || [[ "$ccont" -gt "2020" ]]; then continue 2; fi
			elif [[ "$nname" = "eyr" ]]; then
				if [[ "$(echo -n $ccont|wc -c)" != "4" ]]; then continue 2; fi
				if [[ "$ccont" -lt "2020" ]] || [[ "$ccont" -gt "2030" ]]; then continue 2; fi
			elif [[ "$nname" = "hgt" ]]; then
				if [[ $(echo "$ccont"|grep 'cm') != "" ]]; then
					hgt=$(echo "$ccont"|sed -e 's/cm//g')
					if [[ "$hgt" -lt "150" ]] || [[ "$hgt" -gt "193" ]]; then continue 2; fi
				elif [[ $(echo "$ccont"|grep 'in') != "" ]]; then
					hgt=$(echo "$ccont"|sed -e 's/in//g')
					if [[ "$hgt" -lt "59" ]] || [[ "$hgt" -gt "76" ]]; then continue 2; fi
				else continue 2;
				fi
			elif [[ "$nname" = "hcl" ]]; then
				if [[ "$(echo -n $ccont|wc -c)" != "7" ]]; then continue 2; fi
				if [[ $(echo "$ccont"| grep -E '^#([a-f0-9]{6})') = "" ]]; then continue 2; fi
			elif [[ "$nname" = "ecl" ]]; then
				colcheck=0
				for i in amb blu brn gry grn hzl oth; do
					if [[ "$ccont" = "$i" ]]; then colcheck="1"; fi
				done
				if [[ "$colcheck" != "1" ]]; then continue 2; fi
			elif [[ "$nname" = "pid" ]]; then
				if [[ "$(echo -n $ccont|wc -c)" != "9" ]]; then continue 2; fi
				if [[ "$(echo $ccont|grep -E '([0-9]{9})' )" = "" ]]; then continue 2; fi
			elif [[ "$nname" = "cid" ]]; then a="1";
			else continue 2;
			fi
		done
	vvalid=$((vvalid+1))
	fi
done <input2.txt
#done <invalid.txt
#done <valid.txt
echo "$vvalid"
