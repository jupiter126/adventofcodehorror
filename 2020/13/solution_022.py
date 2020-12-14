# run sh to define correct values

bus1 = 37
t1 = 37
bus2 = 41
t2 = 10
bus3 = 457
t3 = 0
bus4 = 13
t4 = 13
bus5 = 17
t5 = 14
bus6 = 23
t6 = 23
bus7 = 29
t7 = 29
bus8 = 431
t8 = 31
bus9 = 19
t9 = 50

rrounds = 10000000000
ddone = 0

starttime = 4859053838096
magnum = 199298892313

while ddone == 0:
# starttime = bus3 * rrounds    #run this first until it spews print(parttime) twice, then set starttime at the last seen starttime and the obtained difference in magnum
# starttime = starttime + magnum # if previous step complete, comment previous line and uncomment this one.
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
