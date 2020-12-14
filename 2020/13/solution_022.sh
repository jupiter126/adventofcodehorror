
function f_setvars {
	re='^[0-9]+$'
	bus1=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f1 -d',')
	wait1=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f1 -d'|'|echo "$(wc -c)")
	bus2=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f2 -d',')
	wait2=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f2 -d'|'|echo "$(wc -c)")
	bus3=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f3 -d',')
	wait3=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f3 -d'|'|echo "$(wc -c)")
	bus4=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f4 -d',')
	wait4=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f4 -d'|'|echo "$(wc -c)")
	bus5=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f5 -d',')
	wait5=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f5 -d'|'|echo "$(wc -c)")
	bus6=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f6 -d',')
	wait6=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f6 -d'|'|echo "$(wc -c)")
	bus7=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f7 -d',')
	wait7=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f7 -d'|'|echo "$(wc -c)")
	bus8=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f8 -d',')
	wait8=$(tail -n1 input.txt |sed -e 's/[0-9]//g' -e 's/,,/|/g' -e 's/|,/||/g' -e 's/,//g'|cut -f8 -d'|'|echo "$(wc -c)")
	bus9=$(tail -n1 input.txt |sed -e 's/,x//g'|cut -f9 -d',')
	echo "bus1 $bus1 wait1 $wait1 bus2 $bus2 wait2 $wait2 bus3 $bus3 wait3 $wait3 bus4 $bus4 wait4 $wait4 bus5 $bus5 wait5 $wait5 bus6 $bus6 wait6 $wait6 bus7 $bus7 wait7 $wait7 bus8 $bus8 wait8 $wait8 bus9 $bus9"
}

f_setvars

# bus1 37  wait1 26	t-35
# bus2 41  wait2 9	t-9
# bus3 457 wait3 12  --> bigbus=t0
# bus4 13  wait4 0	t+12
# bus5 17  wait5 8	t+12 13
# bus6 23  wait6 5	t+20 21
# bus7 29  wait7 1	t+25 26
# bus8 431 wait8 18	t+26 27
# bus9 19		t+44 45
longbus=457
rrounds="$((100000000000000/457))"
while true; do
	(( rrounds ++ ))
	starttime=$((longbus*rrounds))
	if [[ "$((rrounds%10000))" = "0" ]]; then echo "$starttime"; fi
	# Do longest busses first - adapt by hand \o/
	modulu=$(echo "($starttime+26)%$bus8"|bc) && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime-9)%$bus2"|bc)  && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime-35)%$bus1"|bc) && echo 3 && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime+26)%$bus7"|bc) && echo 4 && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime+21)%$bus6"|bc) && echo 5 && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime+45)%$bus9"|bc) && echo 6 && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime+13)%$bus5"|bc) && echo 7 && [ "$modulu" = "0" ] || continue
	modulu=$(echo "($starttime+12)%$bus4"|bc) && [ "$modulu" = "0" ] || continue
	break 2
done
echo "bus1 started at ($starttime-35)%$bus1"
