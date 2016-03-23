# This file will change the limits in forward.in and reverse.in to reflect the limits in the B000xx.txt files

import math
import re

readfile = 'B00001.txt'

# Set up a list of all the x and y values (really only need the first and last value, but this is easy enough)
x = list()
y = list()

# Get all the x and y values so we can figure out the limits
try:
  fh = open(readfile, 'r') #file to read
  i = -2 #line number
  
except: print "Error opening file."

else:  
  #get data from B00001.txt file
  for line in fh:
    i = i + 1
    if i == -1:
      #read header info (currently just ignoring it)
      continue
    
    #read file contents, replace commas with decimal places
    line = str.replace(line, ',', '.')
    numbers = re.findall('[0-9e.-]+',line)
	  
    xi = float(numbers[0])
    yi = float(numbers[1])

    if xi not in x: x.append(xi)
    if yi not in y: y.append(yi)

fh.close()

x.sort()
y.sort()

xmin = math.floor(x[0])/1000
xmax = math.ceil(x[len(x)-1])/1000

ymin = math.floor(y[0])/1000
ymax = math.ceil(y[len(y)-1])/1000

#print xmin, xmax, ymin, ymax

# nonCart.in is the template file, foward.in is the file that actually gets read
forward = '../input/forward_template.in'
reverse = '../input/reverse_template.in'

forwardwrite = '../input/forward.in'
reversewrite = '../input/reverse.in'

fh = open(forward)
fh2 = open(forwardwrite, 'w')

# Open the template, copy it to the file that gets read, change the limits
for line in fh:
  if line.startswith('FTLE_MeshBounds.XMin'):
    #No idea why this one needs to be different, but if I do it the same
    #as the others it doesn't print a newline character at the end.
    fh2.write('FTLE_MeshBounds.XMin = {0:f}\n'.format(xmin))
  elif line.startswith('FTLE_MeshBounds.XMax'):
    fh2.write('FTLE_MeshBounds.XMax = {0:f}\n'.format(xmax))
  elif line.startswith('FTLE_MeshBounds.YMin'):
    fh2.write('FTLE_MeshBounds.Ymin = {0:f}\n'.format(ymin))
  elif line.startswith('FTLE_MeshBounds.YMax'):
    fh2.write('FTLE_MeshBounds.Ymax = {0:f}\n'.format(ymax))
  else:
    fh2.write(line)
fh.close()
fh2.close()


fh = open(reverse)
fh2 = open(reversewrite, 'w')

# Open the template, copy it to the file that gets read, change the limits
for line in fh:
  if line.startswith('FTLE_MeshBounds.XMin'):
    #No idea why this one needs to be different, but if I do it the same
    #as the others it doesn't print a newline character at the end.
    fh2.write('FTLE_MeshBounds.XMin = {0:f}\n'.format(xmin))
  elif line.startswith('FTLE_MeshBounds.XMax'):
    fh2.write('FTLE_MeshBounds.XMax = {0:f}\n'.format(xmax))
  elif line.startswith('FTLE_MeshBounds.YMin'):
    fh2.write('FTLE_MeshBounds.Ymin = {0:f}\n'.format(ymin))
  elif line.startswith('FTLE_MeshBounds.YMax'):
    fh2.write('FTLE_MeshBounds.Ymax = {0:f}\n'.format(ymax))
  else:
    fh2.write(line)
fh.close()
fh2.close()

# Write limits to a file that can be used to translate mesh numbers back into mm
limitsR = '../output/limits_forward.txt'
limitsF = '../output/limits_reverse.txt'

fh = open(limitsR, 'w')
fh2 = open(limitsF, 'w')

fh.write('FTLE_MeshBounds.XMin = {0:f}\n'.format(xmin))
fh.write('FTLE_MeshBounds.XMax = {0:f}\n'.format(xmax))
fh.write('FTLE_MeshBounds.Ymin = {0:f}\n'.format(ymin))
fh.write('FTLE_MeshBounds.Ymax = {0:f}'.format(ymax))

fh2.write('FTLE_MeshBounds.XMin = {0:f}\n'.format(xmin))
fh2.write('FTLE_MeshBounds.XMax = {0:f}\n'.format(xmax))
fh2.write('FTLE_MeshBounds.Ymin = {0:f}\n'.format(ymin))
fh2.write('FTLE_MeshBounds.Ymax = {0:f}'.format(ymax))

fh.close()
fh2.close()