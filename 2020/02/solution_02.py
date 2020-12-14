vvalid = 0
with open('input.txt') as my_file:
	for x in my_file.readlines():
		lline=x.strip()
		replace = lline.replace("-", " ").replace(":", "").split(" ")
		oone=replace[3][int(replace[0]) - 1]
		ttwo=replace[3][int(replace[1]) - 1]
		if oone != ttwo:
			if oone == replace[2] or ttwo == replace[2]:
				vvalid = vvalid + 1
print(vvalid)
