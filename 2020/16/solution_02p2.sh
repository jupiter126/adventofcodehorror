# run then sort answer.txt by hand ^^
inputfile="input-3.txt"

for lline in $(cat input-1.txt |sed -e 's/[a-z] [a-z]/_/g' -e 's/ or /-/g' -e 's/ /-/g'); do
		rulename="$(echo $lline|cut -f1 -d'-')"
		rule1="$(echo $lline|cut -f2 -d'-')"
		rule2="$(echo $lline|cut -f3 -d'-')"
		rule3="$(echo $lline|cut -f4 -d'-')"
		rule4="$(echo $lline|cut -f5 -d'-')"
		for y in {1..20}; do
			for x in $(cat input-3.txt|cut -f $y -d','); do
				(([ "$x" -ge "$rule1" ] && [ "$x" -le "$rule2" ]) || ([ "$x" -ge "$rule3" ] && [ "$x" -le "$rule4" ])) || continue 2
			done
			echo "field y=$y matches $rulename" >> answer.txt
		done
done
