bus1 = 37
t1 = 35
bus2 = 41
t2 = 9
bus3 = 457
t3 = 0
bus4 = 13
t4 = 12
bus5 = 17
t5 = 13
bus6 = 23
t6 = 21
bus7 = 29
t7 = 26
bus8 = 431
t8 = 27
bus9 = 19
t9 = 45

rrounds = 1
ddone = 0

while rrounds <= 218818380743 or ddone == 0:
 starttime = bus3 * rrounds
# if rrounds % 1000000 == 0:
#  print(starttime)
 if (starttime + t8) % bus8 == 0:
  if (starttime - t2) % bus2 == 0:
   if (starttime - t1) % bus1 == 0:
    if (starttime + t7) % bus7 == 0:
     if (starttime + t6) % bus6 == 0:
      print(starttime)
      if (starttime + t9) % bus9 == 0:
       if (starttime + t5) % bus5 == 0:
        if (starttime + t4) % bus4 == 0:
         ddone = 1
 rrounds = rrounds + 1

print(starttime)
print(starttime - t1)
