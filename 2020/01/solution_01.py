import array

x = array.array('i', [])
with open("input.txt") as file:
    for l in file:
        x.append(int(l.strip()))
len(x)
startnum = int(0)
while startnum < 200:
	secnum = int(startnum+1)
	while secnum < 200:
		numa = x[startnum]
		numb = x[secnum]
		testsum = int(numa+numb)
		if testsum == 2020:
			print(numa*numb)
		secnum += 1
	startnum += 1
