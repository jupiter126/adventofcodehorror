ttime=$(head -n1 input.txt)
for bbus in $(tail -n1 input.txt|sed -e 's/,x//g' -e 's/,/ /g'); do
	wwait=$((bbus-(ttime%bbus)))
	echo "$bbus $wwait"
done
