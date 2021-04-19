
import os
import sys
from PIL import Image

for q in range(10, 60, 10):
	for ifile in range(1,30):
		output = './JPEG_Results/'+str(ifile)+'_'+str(q)+'.jpg'
		filepath = './LIVE1/'+str(ifile)+'.bmp'
		original = Image.open(filepath)
		original.save(output, "JPEG", optimize = True, quality = q)
