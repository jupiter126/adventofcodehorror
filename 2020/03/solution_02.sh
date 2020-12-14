#removed first line of input.txt to make it work
x=1

# Right 1, down 1.
trees1=0
while IFS= read -r; do
	if [[ "$x" = 31 ]]; then x=1;
	else x=$((x+1))
	fi
        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
	if [[ "$istree" = "#" ]]; then
		trees1=$((trees1+1))
	fi
done <input.txt
echo $trees1

# Right 3, down 1.
x=1
trees2=0
while IFS= read -r; do
	if [[ "$x" = 29 ]]; then x=1;
	elif [[ "$x" = 30 ]]; then x=2;
	elif [[ "$x" = 31 ]]; then x=3;
	else x=$((x+3))
	fi
        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
	if [[ "$istree" = "#" ]]; then
		trees2=$((trees2+1))
	fi
done <input.txt
echo $trees2

# Right 5, down 1.
x=1
trees3=0
while IFS= read -r; do
	if [[ "$x" = 27 ]]; then x=1;
	elif [[ "$x" = 28 ]]; then x=2;
	elif [[ "$x" = 29 ]]; then x=3;
	elif [[ "$x" = 30 ]]; then x=4;
	elif [[ "$x" = 31 ]]; then x=5;
	else x=$((x+5))
	fi
        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
	if [[ "$istree" = "#" ]]; then
		trees3=$((trees3+1))
	fi
done <input.txt
echo $trees3

# Right 7, down 1.
x=1
trees4=0
while IFS= read -r; do
	if [[ "$x" = 25 ]]; then x=1;
	elif [[ "$x" = 26 ]]; then x=2;
	elif [[ "$x" = 27 ]]; then x=3;
	elif [[ "$x" = 28 ]]; then x=4;
	elif [[ "$x" = 29 ]]; then x=5;
	elif [[ "$x" = 30 ]]; then x=6;
	elif [[ "$x" = 31 ]]; then x=7;
	else x=$((x+7))
	fi
        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
	if [[ "$istree" = "#" ]]; then
		trees4=$((trees4+1))
	fi
done <input.txt
echo $trees4

# Right 1, down 2.
trees5=0
y=1
x=1
while IFS= read -r; do
	if [[ $(($y%2)) -eq 0 ]] ; then
		y=$((y+1))
		if [[ "$x" = 31 ]]; then x=1;
		else x=$((x+1))
		fi
	        istree=$(echo $REPLY| head -c "$x" | tail -c 1)
		if [[ "$istree" = "#" ]]; then
			trees5=$((trees5+1))
		fi
	else
		y=$((y+1))
	fi
done <input.txt
echo $trees5

echo "$trees1*$trees2*$trees3*$trees4*$trees5"|bc
