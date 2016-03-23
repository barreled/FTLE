# This file converts velocity data from B000xx.txt files into .bin files that flowVC will read
#I can also change Data_MeshBounds.XXXX, FTLE_MeshBounds.XXXX, Trace_MeshBounds.XXXX, VelOut_MeshBounds.XXXX
#in the FTLE.in file

# Only considers nodes with data in all the frames

import struct
import re
import time

test_element = 15
border = 0 #number of border elements

start = time.clock() #for figuring out how fast the code ran

data = list()
j = 0 #file number
k = 0 #node index number for non-Cartesian geometry, zero-indexed
x = list()
y = list()

xd = dict() #make a dictionary converting between x value and x index
yd = dict() #make a dictionary converting between x value and x index

xs = dict() #make a dictionary converting between x value and x binary value, faster than recalculating
ys = dict() #make a dictionary converting between y value and y binary value, faster than recalculating

pos = list() #list of tuples (position number, index number, xi, yi, 0.0), zero indexed position and element
pos1 = list() #list of tuples, (position number, index number, x_index, y_index, 0), zero indexed position and element
element = list() # list of tuples, (element number, node 1, node 2, node 3)
adjacent = list() # list, (adjacent node 1, adjancent node 2, adjacent node 3)
# (-1 if non-existant)

mesh = list() #list to check if that node should be written

#wi is always 0, so only do the operation once
wi = 0.0
wi = struct.pack('d', wi)

#set up non-Cartesian geometry
fh3 = open('dg_coordinates.bin', 'wb')
fh4 = open('dg_connectivity.bin', 'wb')
fh5 = open('dg_adjacency.bin', 'wb')

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
 
      if j == 1:
	if xi not in x: x.append(xi)
	if yi not in y: y.append(yi)
	if (ui == 0) & (vi == 0):
	  pos.append((i, -1, xi, yi, 0.0)) # Don't index nodes that have zeroes for velocity since they're outside the bag
	  continue
	else:
	  pos.append((i, k, xi, yi, 0.0))
	  k = k + 1
	  mesh.append(i)
	  
      elif (ui == 0) & (vi == 0): # delete all the nodes that shouldn't be in the mesh that were in the first frame's mesh
	if i in mesh:
	  pos[i] = (i, -1, xi, yi, 0.0)
	  k = k + 1
	  mesh.remove(i)

    print 'Intializing mesh... Processed {:s}'.format(readfile)
    fh.close()
    
print len(pos), 'possible nodes'

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
for xi in x:
  #print xi
  xd[xi] = i0
  xs[xi] = struct.pack('d', xi/1000) #Convert from mm to m
  i0 = i0 + 1

# make a dictionary converting between y value and y index. Faster than doing list lookups
i0 = 0
for yi in y: 
  #print yi
  yd[yi] = i0
  ys[yi] = struct.pack('d', yi/1000) #Convert from mm to m
  i0 = i0 + 1

#write number of nodes to dg_coordinates.bin
print '{:d} nodes found'.format(k)
k = struct.pack('i', k)
fh3.write(k)

#write coordinates for each node to dg_coordinates
for position, index, xi, yi, zi in pos2:
  #make a pos1 list, full of tuples, (position number, index number, x_index, y_index, 0)
  pos1.append((position, index, xd[xi], yd[yi], 0))
  
  if index == -1: continue  #don't write non-zero indexed nodes
  xi = xs[xi]
  yi = ys[yi]
  
  fh3.write(xi)
  fh3.write(yi)
  fh3.write(wi) #since z is always 0, use a shortcut
fh3.close()

xlen = len(x)
xmax = xlen - 1 # max x index
ylen = len(y)
ymin = 0 #min y index

y.sort(reverse = True)

x0 = 0
y0 = 0
position0 = 0

x1 = 0
y1 = 0
position1 = 0

x2 = 0
y2 = 0
position2 = 0

x3 = 0
y3 = 0
position3 = 0

x4 = 0
y4 = 0
position4 = 0

x5 = 0
y5 = 0
position5 = 0

index0 = -1
index2 = -1
index3 = -1
index4 = -1
index5 = -1


#set up elements for dg_connectivity
for position1, index1, x1, y1, z1 in pos1:
  if index1 == -1: continue #ignore elements with 0 velocities
  #reset nodes
  sl = 0
  sr = 0
  dl = 0
  ds = 0
  dr = 0	
  
  if y1 == ymin: continue #don't check anything in the last row since there's no nodes beneath it
  (position4, index4, x4, y4) = pos1[position1 + xlen][0:4] #node straight down
  
  if x1 != xmax:  #nodes exist to the right
    (position2, index2, x2, y2) = pos1[position1 + 1][0:4] #node to the right
    (position5, index5, x5, y5) = pos1[position1 + 1 + xlen][0:4] #node down and to the right
  if x1 != 0: #nodes exist to the left
    (position3, index3, x3, y3) = pos1[position1 - 1 + xlen][0:4] #node down and to the left
    (position0, index0, x0, y0) = pos1[position1 - 1][0:4] #node to the left
    
  #Check that the position logic is right
  #if position1 < 40:
    #print 'Node 0:', x0, y0, x[x0], y[y0], pos1[position0]
    #print 'Node 1:', x1, y1, x[x1], y[y1], position1, pos1[position1]
    #print 'Node 2:', x2, y2, x[x2], y[y2], pos1[position2]
    #print 'Node 3:', x3, y3, x[x3], y[y3], pos1[position3]
    #print 'Node 4:', x4, y4, x[x4], y[y4], pos1[position4]
    #print 'Node 5:', x5, y5, x[x5], y[y5], pos1[position5]
    #print ""
    
  if index0 != -1: sl = 1
  if index2 != -1: sr = 1
  if index3 != -1: dl = 1
  if index4 != -1: ds = 1
  if index5 != -1: dr = 1
  
  el0 = el
  #element creation logic
  
  ##### New logic
  #if ((not sl) & dl & ds):
    #element.append((el, index1, index3, index4))
    #el = el + 1
  #if (ds & dr):
    #element.append((el, index1, index4, index5))
    #el = el + 1
  #if (sr & dr):
    #element.append((el, index1, index2, index5))
    #el = el + 1
  #if ((not dr) & sr & ds):
    #element.append((el, index1, index2, index4))
    #el = el + 1	
  
  
  # Old logic (works, but something leads to weird artifacts)
  if (ds & dl):
    element.append((el, index1, index3, index4))
    el = el + 1
  if (sr & ds):
    element.append((el, index1, index2, index4))
    el = el + 1
  if ((not sr) & ds & dr):
    element.append((el, index1, index4, index5))
    el = el + 1
  if ((not ds) & dr & sr):
    element.append((el, index1, index2, index5))
    el = el + 1
    
  #if position1 < 40:  
    #print '{:d} elements for node {:d}'.format(el - el0, index1)
    
  if (el - el0) > 2: print 'Element {:d} has {:d} nodes.'.format(position1, el - el0)
  
#Write element data to dg_connectivity.bin
print '{:d} elements found'.format(el)
el = struct.pack('i',el)
fh4.write(el)
fh5.write(el)

index4 = struct.pack('i', -1) #since this is always 0 for 2D data, just do the calculation once
for el, index1, index2, index3 in element:
  index1 = struct.pack('i', index1)
  index2 = struct.pack('i', index2)
  index3 = struct.pack('i', index3)
  
  fh4.write(index1)
  fh4.write(index2)
  fh4.write(index3)
  fh4.write(index4)
fh4.close()

adj4 = struct.pack('i', -1) #since this is always 0 for 2D data, just do the calculation once
      
#figure out adjacency
xlen1 = 0 #counter that will increase until it hits xlen (to prevent out of index errors)
xlen2 = 2 * xlen + 5
for el1, i11, i12, i13 in element:
  
  #Reset adjacent element indices
  adj1 = -1
  adj2 = -1
  adj3 = -1
  
  # Ideally I want to look at a subsection of the element matrix for a match since it would be way quicker,
  # but for some reason that's giving me issues with not finding adjacent elements. I should be able to loop over
  # +/- len(x) elements on either side of el1 and still find everything, but it doesn't seem to work...
  # The first bit won't work because 
	  
  for el2, i21, i22, i23 in element[el1 - xlen1:el1 + xlen2]:
    if el1 == el2: continue #skip it if it's the same element
    i2 = [i21, i22, i23] #current element indices
    
    #if two of the three indices from element 1 are also in current element, it's adjacent
    if (i11 in i2) & (i12 in i2): adj1 = el2
    elif (i11 in i2) & (i13 in i2): adj2 = el2
    elif (i12 in i2) & (i13 in i2): adj3 = el2

    
    #if (el2 == test_element) and (el2 > el1):
      #print 'Hey!'
      #print 'Element {:d}: '.format(el1), i11, i12, i13, '\t', 'Element {:d}:'.format(el2), i21, i22, i23
      #print 'i11 in 2: {:b}'.format(i11 in i2), 'i12 in 2: {:b}'.format(i12 in i2), 'i13 in 2: {:b}'.format(i13 in i2), 
    
    #if (i11 in i2) or (i12 in i2) or (i13 in i2):
      #if el1 == test_element:
	#print 'Element {:d}: '.format(el1), i11, i12, i13, '\t', 'Element {:d}:'.format(el2), i21, i22, i23
  
  if xlen1 < (2 * xlen + 5): xlen1 = el1
  if (adj1 == -1) or (adj2 == -1) or (adj3 == -1): border = border + 1
  ## Test if elements are properly connected
  #if el1 >= test_element:
    #print 'Element {:d}: '.format(el1), 'Neighbor 1: {:d}, Neighbor 2: {:d}, Neighbor 3: {:d}'.format(adj1, adj2, adj3)
    
  #if el1 < 10:
    #print i11, i12, i13
  
  #convert to binary
  adj1 = struct.pack('i', adj1)
  adj2 = struct.pack('i', adj2)
  adj3 = struct.pack('i', adj3)
  
  #write to file
  fh5.write(adj2)
  fh5.write(adj1)
  fh5.write(adj3)
  fh5.write(adj4)
print 'There are {:d} border elements.'.format(border)
fh5.close()
print 'Done connecting elements.'
      

#Write all the velocity files
j = 0
while 1:
  j = j + 1 
  
  #assign the filename to read (B000xx.txt)
  readfile = 'B{0:05d}.txt'.format(j) #one indexed
  #assign the filename to write (datain.xx.bin)
  writefile = 'dg_vel.{:d}.bin'.format(j) # one indexed
  
  try:
    fh = open(readfile, 'r') #file to read
    fh2 = open(writefile, 'wb') #file to write
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
      
      #ignore nodes not in the mesh and force nodes from the current file to appear even if they're zeroes 
      if i not in mesh: continue 
      
      #read file contents, replace commas with decimal places and convert to binary
      line = str.replace(line, ',', '.')
      numbers = re.findall('[0-9e.-]+',line)
            
      xi = float(numbers[0])
      yi = float(numbers[1])
      ui = float(numbers[2])
      vi = float(numbers[3])
    
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
