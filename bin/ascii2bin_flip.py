# This file converts velocity data from B000xx.txt files into .bin files that flowVC will read
#I can also change Data_MeshBounds.XXXX, FTLE_MeshBounds.XXXX, Trace_MeshBounds.XXXX, VelOut_MeshBounds.XXXX
#in the FTLE.in file

#Also sorts the data so it goes ymin->ymax, default is ymax->ymin

import struct
import re

data = list()
j = 0
x = list()
y = list()

#wi is always 0, so only do the operation once
wi = 0.0
wi = struct.pack('d', wi)

#set up Cartesian grid
fh3 = open('dgflipped_Cartesian.bin', 'wb')

while 1:
  j = j + 1
  
  #assign the filename to read (B000xx.txt)
  readfile = 'B{0:05d}.txt'.format(j)
  #assign the filename to write (datain.xx.bin)
  writefile = 'dgflipped_vel.{:d}.bin'.format(j)
  
  try:
    fh = open(readfile, 'rb') #file to read
    fh2 = open(writefile, 'wb') #file to write
    i = 0

    #figure out timestamp
    timestamp = (j - 1) * 0.025
    
    #write timestamp to bin file
    timestamp = struct.pack('d', timestamp)
    fh2.write(timestamp)
    
    if j == 1:
      #get data from B00xxx.txt file to figure out x and y range
      for line in fh:
	i = i + 1
	if i == 1:
	  #read header info (currently just ignoring it)
	  continue
	
	#read file contents, replace commas with decimal places and convert to binary
	line = str.replace(line, ',', '.')
	numbers = re.findall('[0-9e.-]+',line)
	
	      
	xi = float(numbers[0]/1000)
	yi = float(numbers[1]/1000)
	    
	if j == 1:
	  #append x and y values to list if value is unique
	  if xi not in x: x.append(xi)
	  if yi not in y: y.append(yi)
	      
      #find max, min, and res for x and y, convert to bin, export

      x.sort()
      y.sort()
      
      xmax = struct.pack('d', x[len(x)-1])
      xmin = struct.pack('d', x[0])
      xres = struct.pack('i', len(x))
      
      ymax = struct.pack('d', y[len(y)-1])
      ymin = struct.pack('d', y[0])
      yres = struct.pack('i', len(y))
      
      zmax = struct.pack('d', 0.0)
      zmin = struct.pack('d', 0.0)
      zres = struct.pack('d', 1.0)
      
      fh3.write(xmin)
      fh3.write(xmax)
      fh3.write(xres)
      fh3.write(ymin)
      fh3.write(ymax)
      fh3.write(yres)
      fh3.write(zmin)
      fh3.write(zmax)
      fh3.write(zres)
      fh3.close()
    
    # Add data to bin file in ascending y order
    for val in y:
      i = 0
      fh.seek(0)
      for line in fh:
	i = i + 1
	if i == 1:
	  continue
	line = str.replace(line, ',', '.')
	numbers = re.findall('[0-9e.-]+',line)
	    
	yi = float(numbers[1])
	
	if yi == val:
	  ui = float(numbers[2])
	  vi = float(numbers[3])
	
	  ui = struct.pack('d', ui)
	  vi = struct.pack('d', vi)
	  
	  #write data to bin file
	  fh2.write(ui)
	  fh2.write(vi)
	  fh2.write(wi)       
        
      
      #print (x[1]-x[0])
      #print (y[1]-y[0])
      #print y
      #print y[0],y[len(y)-1]
      #print len(y)
      #print x
      #print x[0],x[len(x)-1]
      #print len(x)
  
  #except:
    #break

  finally:
    fh.close()
    fh2.close()
