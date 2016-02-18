# This should convert files named dg_forwardFTLE.X.bin into CSV files that can be read into Matlab

import struct
import time

start = time.clock() #for figuring out how fast the code ran
i = 0
xres = 344

while 1:
#while i == 0: #for testing, only does one file
  j = 0
  try:
    readfile = 'dg_forwardFTLE.{:d}.bin'.format(i)
    fh = open(readfile, 'rb')

  except:
    print 'File not found: {:s}'.format(readfile)
    break
  
  writefile = 'converted.{:d}.csv'.format(i)
  fh2 = open(writefile, 'w')
  
  try:
    byte = fh.read(8)
    while byte != '':
      if j == 0:
	timestamp = str(struct.unpack('d',byte)[0])
      else:
	## struct.unpack returns a tuple, so to get a float you need to use [0] at the end
	eig = str(struct.unpack('d', byte)[0])
	if eig == '-1.0': fh2.write('NaN')
	else: fh2.write(eig)
	if j%xres != 0: fh2.write(',\t')
	else: fh2.write('\n')
	
      byte = fh.read(8)
      j = j + 1
      
      ##break at 200 for testing
      #if i == 200: byte = ''
      
    print 'Processed {:s}'.format(readfile)
    i = i + 1
  #except: 
    #print 'error in inner loop'
  finally:
    fh.close()


i = 0
while 1:
#while i == 0: #for testing, only does one file
  j = 0
  try:
    readfile = 'dg_forwardFTLE_noT.{:d}.bin'.format(i)
    fh = open(readfile, 'rb')

  except:
    print 'File not found: {:s}'.format(readfile)
    break
  
  writefile = 'converted_noT.{:d}.csv'.format(i)
  fh2 = open(writefile, 'w')
  
  try:
    byte = fh.read(8)
    while byte != '':
      if j == 0:
	timestamp = str(struct.unpack('d',byte)[0])
      else:
	## struct.unpack returns a tuple, so to get a float you need to use [0] at the end
	eig = str(struct.unpack('d', byte)[0])
	if eig == '-1.0': fh2.write('NaN')
	else: fh2.write(eig)
	if j%xres != 0: fh2.write(',\t')
	else: fh2.write('\n')
	
      byte = fh.read(8)
      j = j + 1
      
      ##break at 200 for testing
      #if i == 200: byte = ''
      
    print 'Processed {:s}'.format(readfile)
    i = i + 1
  #except: 
    #print 'error in inner loop'
  finally:
    fh.close()


i = 0
while 1:
#while i == 0: #for testing, only does one file
  j = 0
  try:
    readfile = 'dg_reverseFTLE_noT.{:d}.bin'.format(i)
    fh = open(readfile, 'rb')

  except:
    print 'File not found: {:s}'.format(readfile)
    break
  
  writefile = 'converted_reverse_noT.{:d}.csv'.format(i)
  fh2 = open(writefile, 'w')
  
  try:
    byte = fh.read(8)
    while byte != '':
      if j == 0:
	timestamp = str(struct.unpack('d',byte)[0])
      else:
	## struct.unpack returns a tuple, so to get a float you need to use [0] at the end
	eig = str(struct.unpack('d', byte)[0])
	if eig == '-1.0': fh2.write('NaN')
	else: fh2.write(eig)
	if j%xres != 0: fh2.write(',\t')
	else: fh2.write('\n')
	
      byte = fh.read(8)
      j = j + 1
      
      ##break at 200 for testing
      #if i == 200: byte = ''
      
    print 'Processed {:s}'.format(readfile)
    i = i + 1
  #except: 
    #print 'error in inner loop'
  finally:
    fh.close()


i = 0
while 1:
#while i == 0: #for testing, only does one file
  j = 0
  try:
    readfile = 'dg_reverseFTLE.{:d}.bin'.format(i)
    fh = open(readfile, 'rb')

  except:
    print 'File not found: {:s}'.format(readfile)
    break
  
  writefile = 'converted_reverse.{:d}.csv'.format(i)
  fh2 = open(writefile, 'w')
  
  try:
    byte = fh.read(8)
    while byte != '':
      if j == 0:
	timestamp = str(struct.unpack('d',byte)[0])
      else:
	## struct.unpack returns a tuple, so to get a float you need to use [0] at the end
	eig = str(struct.unpack('d', byte)[0])
	if eig == '-1.0': fh2.write('NaN')
	else: fh2.write(eig)
	if j%xres != 0: fh2.write(',\t')
	else: fh2.write('\n')
	
      byte = fh.read(8)
      j = j + 1
      
      ##break at 200 for testing
      #if i == 200: byte = ''
      
    print 'Processed {:s}'.format(readfile)
    i = i + 1
  #except: 
    #print 'error in inner loop'
  finally:
    fh.close()

#  except: break
end = time.clock()
print 'Time elapsed... {:f} seconds'.format((end - start))
