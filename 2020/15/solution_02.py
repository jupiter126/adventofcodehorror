a = [0] * 30000001
a[0] = 3; a[1] = 5; a[7] = 6; a[11] = 1; a[18] = 2; a[20] = 4
pos = 7; init = 16
while pos < 30000001:
 if a[init] == 0:
  initnew = 0
 else:
  initnew = pos - a[init]
 a[init] = pos
 init = initnew
 pos = pos + 1
print(a.index(30000000))
