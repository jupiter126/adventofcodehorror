vvalid = 0
with open('input.txt') as my_file:
	for x in my_file.readlines():
		lline=x.strip()
		replace = lline.replace("-", " ").replace(":", "").split(" ")
		count = 0
		for letter in replace[3]:
			if letter == replace[2]:
				count = count + 1
		if int(count) >= int(replace[0]) and int(count) <= int(replace[1]):
			vvalid = vvalid + 1
print(vvalid)


