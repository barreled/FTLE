# This file converts velocity data from B000xx.txt files into .bin files that flowVC will read
#I can also change Data_MeshBounds.XXXX, FTLE_MeshBounds.XXXX, Trace_MeshBounds.XXXX, VelOut_MeshBounds.XXXX
#in the FTLE.in file


import struct
import re

data = list()
j = 0
x = list()
y = list()
u = list()
v = list()

j = j + 1

#assign the filename to read (B000xx.txt)
readfile = 'B{0:05d}.txt'.format(j)
#assign the filename to write (datain.xx.bin)
writefile = 'dg_vel.{:d}.bin'.format(j)

try:
  fh = open(readfile, 'rb') #file to read
  fh2 = open(writefile, 'wb') #file to write
  i = 0

  #figure out timestamp
  timestamp = (j - 1) * 0.025
  
  #write timestamp to bin file
  timestamp = struct.pack('d', timestamp)
  fh2.write(timestamp)
      
  #get data from B00xxx.txt file
  for line in fh:
    i = i + 1
    if i == 1:
      #read header info (currently just ignoring it)
      continue
    
    #read file contents, replace commas with decimal places and convert to binary
    line = str.replace(line, ',', '.')
    numbers = re.findall('[0-9e.-]+',line)
	  
    xi = float(numbers[0])
    yi = float(numbers[1])
    ui = float(numbers[2])
    vi = float(numbers[3])
    
    if j == 1:
      #append x value to list if value is unique
      if xi not in x: x.append(xi)
      if yi not in y: y.append(yi)
      u.append(ui)
      v.append(vi)
    
  if j == 1:
    #find max, min, and res for x and y, convert to bin, export
    x.sort()
    y.sort()
    u.sort()
    v.sort()
    
    print u
    #print v
    
    #print (x[1]-x[0])
    #print (y[1]-y[0])
    #print y
    #print y[0],y[len(y)-1]
    #print len(y)
    #print x
    #print x[0],x[len(x)-1]
    #print len(x)

finally:
  fh.close()
  fh2.close()
