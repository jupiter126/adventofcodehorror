import array

x = array.array('i', [])
with open("input.txt") as file:
    for l in file:
        x.append(int(l.strip()))
# len(x)
startnum = int(0)
while startnum < 200:
	secnum = int(startnum+1)
	while secnum < 200:
		thirdnum = int(secnum+1)
		while thirdnum < 200:
			numa = x[startnum]
			numb = x[secnum]
			numc = x[thirdnum]
			testsum = int(numa+numb+numc)
			if testsum == 2020:
				print(numa*numb*numc)
			thirdnum +=1
		secnum += 1
	startnum += 1
