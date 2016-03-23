# This file converts velocity data from B000xx.txt files into .CSV files that can be read by Matlab.
# Discards all the x and y data for now, since I'm just interested in index number

import re
import time

start = time.clock() #for figuring out how fast the code ran

data = list()
j = 0 #file number
k = 0 #node index number for non-Cartesian geometry, zero-indexed

#Write all the velocity files
j = 0
while 1:
  j = j + 1 
  
  #assign the filename to read (B000xx.txt)
  readfile = 'B{0:05d}.txt'.format(j) #one indexed
  #assign the filename to write (datain.xx.bin)
  ufile = 'u.{:d}.csv'.format(j) # one indexed
  vfile = 'v.{:d}.csv'.format(j) # one indexed
  
  try:
    fh = open(readfile, 'r') #file to read
    fh2 = open(writefile, 'wb') #file to write
    fh3 = 
    i = -2 #line number
    
  except: break

  else:

    #figure out timestamp
    timestamp = (j - 1) * 0.025
    
    #write timestamp to bin file
    timestamp = struct.pack('d', timestamp)
    fh2.write(timestamp)
        
    #get data from B00xxx.txt file
    for line in fh:
      i = i + 1
      if i == -1:
	#read header info (currently just ignoring it)
	continue
      
      #read file contents, replace commas with decimal places and convert to binary
      line = str.replace(line, ',', '.')
      numbers = re.findall('[0-9e.-]+',line)
            
      xi = float(numbers[0])
      yi = float(numbers[1])
      ui = float(numbers[2])
      vi = float(numbers[3])
      current = xi, yi
      
      #ignore nodes not in the mesh and force nodes from the current file to appear even if they're zeroes 
      if current not in mesh: continue 
    
      #convert velocities to binary
      ui = struct.pack('d', ui)
      vi = struct.pack('d', vi)
      
      #write data to bin file
      fh2.write(ui)
      fh2.write(vi)
      fh2.write(wi)
      
    print 'Writing velocity files... Processed {:s}'.format(readfile)    
    fh.close()
    fh2.close()
    
end = time.clock()
print 'Time elapsed... {:f} seconds'.format((end - start))
