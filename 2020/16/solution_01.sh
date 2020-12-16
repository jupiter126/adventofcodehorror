# 2172926 too high
#inputfile="inputtest.txt"
inputfile="input.txt"
awk -v RS= '{print > ("input-" NR ".txt")}' $inputfile  #split file in 3 on whitelines
sed -i '1d' input-2.txt
sed -i '1d' input-3.txt
fieldtotal=$(wc -l input-1.txt|cut -f1 -d' ')

function f_checkvalidity {
	fieldnum2="1"
	canary="0"
	while [[ "$fieldnum2" -le "$fieldtotal" ]]; do
#	lline=$(cat input-1.txt |sed -e 's/[a-z] [a-z]/_/g' -e 's/ or /-/g' |cut -f2- -d' '|sed "${fieldnum}q;d")
		lline=$(cat input-1.txt |sed -e 's/[a-z] [a-z]/_/g' -e 's/ or /-/g' |cut -f2- -d' '|sed "${fieldnum2}q;d")
		rule1="$(echo $lline|cut -f1 -d'-')"
		rule2="$(echo $lline|cut -f2 -d'-')"
		rule3="$(echo $lline|cut -f3 -d'-')"
		rule4="$(echo $lline|cut -f4 -d'-')"
#		echo "$x $rule1 $rule2 $rule3 $rule4"
#		(([ "$x" -ge "$rule1" ] && [ "$x" -le "$rule2" ]) || ([ "$x" -ge "$rule3" ] && [ "$x" -le "$rule4" ])) && return 0 || return 1;
#		(([ "$x" -ge "$rule1" ] && [ "$x" -le "$rule2" ]) || ([ "$x" -ge "$rule3" ] && [ "$x" -le "$rule4" ])) || errorrate=$((errorrate+x)); echo $x ;break;
		(([ "$x" -ge "$rule1" ] && [ "$x" -le "$rule2" ]) || ([ "$x" -ge "$rule3" ] && [ "$x" -le "$rule4" ])) && canary="1";
		(( fieldnum2 ++ ))
	done
	if [[ "$canary" = "0" ]]; then errorrate=$((errorrate+x)); fi
}

errorrate="0"

for llline in $(cat input-3.txt); do
	fieldnum="1"
	while [[ "$fieldnum" -le "$fieldtotal" ]]; do
		x="$(echo $llline | cut -f $fieldnum -d',')"
		f_checkvalidity
#		if [[ "$?" != "0" ]]; then echo boum; errorrate=$((errorrate+x)); fi
		(( fieldnum ++ ))
	done
done
echo "$errorrate"
