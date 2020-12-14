ssearching=("shiny gold")

function f_checkbag {
	whichone="$1"
	grep "$whichone" input.txt |grep -v "^$whichone"|cut -f1,2 -d' ' >> temp.txt
}

function f_buildfile {
	while IFS= read -r; do
		f_checkbag "$REPLY"
	done < temp.txt
}

function f_cleanfile {
	cat temp.txt |sort -u > temp2.txt && sleep 1 && mv temp2.txt temp.txt
	curnumlines=$(cat temp.txt | wc -l)
}

f_checkbag "$ssearching"

curnumlines="X"
while [[ "$curnumlines" != "$oldnumlines" ]]; do
	oldnumlines=$(cat temp.txt | wc -l)
	f_buildfile
	f_cleanfile
	curnumlines=$(cat temp.txt | wc -l)
done
