import struct

fh = open('datain.bin', 'rb')
i = 0
try:
  byte = fh.read(8)
  while byte != '':
    if i == 0: timestamp = struct.unpack('d',byte)[0]
    else:
      
      ## struct.unpack returns a tuple, so to get a float you need to use [0] at the end
      ui = struct.unpack('d', byte[0:8])[0]
      vi = struct.unpack('d', byte[8:16])[0]
      wi = struct.unpack('d', byte[16:24])[0]
      
      # test re-encoding (it works!)
      #byte2 = list()
      #byte2[0:8] = struct.pack('d', ui)
      #byte2[8:16] = struct.pack('d', vi)
      #byte2[16:24] = struct.pack('d', wi)
      #byte2 = ''.join(byte2)
      
    #if (i == 107):
      ##print (byte, byte2)
      #print (ui, vi, wi)
    byte = fh.read(24)
    i = i + 1
    
    ##break at 200 for testing
    #if i == 200: byte = ''
    
  print 'Timestamp is',
  print timestamp,
  print 'seconds'
finally:
   fh.close()
