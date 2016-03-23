# This file converts velocity data from B000xx.txt files into .txt files that Matlab can read in
# Outputs 3 intial files, and 2 files for each timestamp:
# X, a 86 x 1 vector with all the X positions
# Y, a 65 x 1 vector with all the Y positions
# time, a 39 x 1 vector with all the timestamps
# uXX, a 86 x 65 vector with u velocity at frame XX
# vXX, a 86 x 65 vector with the v velocity at frame XX


#Considers nodes with data in any frame

import re
import time

start = time.clock() #for figuring out how fast the code ran

data = list()
j = 0 #file number
k = 0 #node index number for non-Cartesian geometry, zero-indexed
x = list()
y = list()

xd = dict() #make a dictionary converting between x value and x index
yd = dict() #make a dictionary converting between x value and x index

pos = list() #list of tuples (position number, index number, xi, yi, 0.0), zero indexed position and element
pos1 = list() #list of tuples, (position number, index number, x_index, y_index, 0), zero indexed position and element
element = list() # list of tuples, (element number, node 1, node 2, node 3)
adjacent = list() # list, (adjacent node 1, adjancent node 2, adjacent node 3)
# (-1 if non-existant)

mesh = list() #list to check if that node should be written

#set up non-Cartesian geometry
fh4 = open('x.txt', 'w')
fh5 = open('y.txt', 'w')
fh6 = open('time.txt', 'w')

el = 0

#read all the files, figure out a mask that covers everything
while 1:
  j = j + 1
  readfile = 'B{0:05d}.txt'.format(j) #one indexed
  try:
    fh = open(readfile, 'r') #file to read
    i = -2 #line number
    
  except: break

  else:        
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
 
      if j == 1:
	if xi not in x: x.append(xi)
	if yi not in y: y.append(yi)
	if (ui == 0) & (vi == 0):
	  pos.append((i, -1, xi, yi, 0.0)) # Don't index nodes that have zeroes for velocity since they're outside the bag
	  continue
	else:
	  pos.append((i, k, xi, yi, 0.0))
	  k = k + 1
	  mesh.append(current)
	  
      elif (ui != 0) & (vi != 0): # add all the nodes that should be in the mesh that weren't in the first frame's mesh
	if current not in mesh:
	  pos[i] = (i, k, xi, yi, 0.0)
	  k = k + 1
	  mesh.append(current)

    print 'Intializing mesh... Processed {:s}'.format(readfile)
    fh.close()
    
k = 0
pos2 = list()
for position, index, xi, yi, zi in pos:
  if index == -1: pos2.append((position, index, xi, yi, zi))
  else:
    pos2.append((position, k, xi, yi, zi))
    k = k + 1

#find max, min, and res for x and y
x.sort()
y.sort()
#y.sort(reverse = True) #since the data goes in order of descending y value, flip the sort?
#If I flip the sort order, I also need to go down and change the 'y1 - 1' comparisons to 'y1 + 1'

i0 = 0 #index number for dictionaries
# make a dictionary converting between x value and x index. Faster than doing list lookups
# also write x data to file
for xi in x:
  #print xi
  xd[xi] = i0
  i0 = i0 + 1
  
xlen = len(x)

fh4.write(str(x[0]))
for xi in x[1:]:
  fh4.write(', {:f}'.format(xi))
fh4.close()  

# make a dictionary converting between y value and y index. Faster than doing list lookups
# also write y data to file
i0 = 0
for yi in y: 
  #print yi
  yd[yi] = i0
  i0 = i0 + 1
  
fh5.write(str(x[0]))
for yi in y[1:]:
	fh5.write(', {:f}'.format(yi))
fh5.close()  


#Write all the velocity files
j = 0
while 1:
  j = j + 1 
  
  #assign the filename to read (B000xx.txt)
  readfile = 'B{0:05d}.txt'.format(j) #one indexed
  #assign the filenames to write (uXX.txt, vXX.txt)
  ufile = 'u{:d}.txt'.format(j) # one indexed
  vfile = 'v{:d}.txt'.format(j) # one indexed
  
  try:
    fh = open(readfile, 'r') #file to read
    fh2 = open(ufile, 'w') #file to write
    fh3 = open(vfile, 'w') #file to write
    i = -2 #line number
  except: break

  else:
    #figure out timestamp
    timestamp = (j - 1) * 0.025
    
    #write timestamp to bin file
    if j == 1: fh6.write(str(timestamp))
    else: fh6.write(', {:f}'.format(timestamp))
        
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
      
      ##ignore nodes not in the mesh and force nodes from the current file to appear even if they're zeroes 
      #if current not in mesh: continue 
      
      #write data to bin file
      if i == 0:
	fh2.write('{:f}'.format(ui))
	fh3.write('{:f}'.format(vi))	
      elif i%xlen == 0:
	fh2.write('\n{:f}'.format(ui))
	fh3.write('\n{:f}'.format(vi))
      else:
	fh2.write(', {:f}'.format(ui))
	fh3.write(', {:f}'.format(vi))
      
    print 'Writing velocity files... Processed {:s}'.format(readfile)   
    fh.close()
    fh2.close()
    fh3.close()
	
fh5.close()
end = time.clock()
print 'Time elapsed... {:f} seconds'.format((end - start))
