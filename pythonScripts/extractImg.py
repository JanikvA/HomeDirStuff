#!/usr/bin/python

'''
This demo extracts all images of a PDF as PNG files, whether they are
referenced by pages or not.
It scans through all objects and selects /Type/XObject with /Subtype/Image.
So runtime is determined by number of objects and image volume.
Usage:
extract_img2.py input.pdf
'''
from __future__ import print_function
import fitz
import sys, time, re

checkXO = r"/Type(?= */XObject)"       # finds "/Type/XObject"
checkIM = r"/Subtype(?= */Image)"      # finds "/Subtype/Image"

if len(sys.argv) != 2:
    print('Usage: %s <input file>' % sys.argv[0])
    exit(0)

t0 = time.clock()
doc = fitz.open(sys.argv[1])
imgcount = 0
lenXREF = doc._getXrefLength()         # number of objects - do not use entry 0!

# display some file info
print("file: %s, pages: %s, objects: %s" % (sys.argv[1], len(doc), lenXREF-1))

for i in range(1, lenXREF):            # scan through all objects
    text = doc._getObjectString(i)     # string defining the object
    isXObject = re.search(checkXO, text)    # tests for XObject
    isImage   = re.search(checkIM, text)    # tests for Image
    if not isXObject or not isImage:   # not an image object if not both True
        continue
    imgcount += 1
    pix = fitz.Pixmap(doc, i)          # make pixmap from image
    if pix.n < 5:                      # can be saved as PNG
        pix.writePNG("img-%s.png" % (i,))
    else:                              # must convert the CMYK first
        pix0 = fitz.Pixmap(fitz.csRGB, pix)
        pix0.writePNG("img-%s.png" % (i,))
        pix0 = None                    # free Pixmap resources
    pix = None                         # free Pixmap resources

t1 = time.clock()
print("run time", round(t1-t0, 2))
print("extracted images", imgcount)

### Other scripts I found. The one above this worked the best so far.

#pyhton2
#import PyPDF2
#from PIL import Image
#if __name__ == '__main__':
#    input1 = PyPDF2.PdfFileReader(open("ATLAS_VBFHinv_18.pdf", "rb"))
#    page0 = input1.getPage(7)
#    xObject = page0['/Resources']['/XObject'].getObject()
#
#    for obj in xObject:
#        print "hi"
#        if xObject[obj]['/Subtype'] == '/Image':
#            size = (xObject[obj]['/Width'], xObject[obj]['/Height'])
#            data = xObject[obj].getData()
#            if xObject[obj]['/ColorSpace'] == '/DeviceRGB':
#                mode = "RGB"
#            else:
#                mode = "P"
#
#            if xObject[obj]['/Filter'] == '/FlateDecode':
#                img = Image.frombytes(mode, size, data)
#                img.save(obj[1:] + ".png")
#            elif xObject[obj]['/Filter'] == '/DCTDecode':
#                img = open(obj[1:] + ".jpg", "wb")
#                img.write(data)
#                img.close()
#            elif xObject[obj]['/Filter'] == '/JPXDecode':
#                img = open(obj[1:] + ".jp2", "wb")
#                img.write(data)
#                img.close()


#python2
#import fitz
#doc = fitz.open("ATLAS_VBFHinv_18.pdf")
#for i in range(len(doc)):
#    print i
#    for img in doc.getPageImageList(i):
#        print len(img)
#        xref = img[0]
#        pix = fitz.Pixmap(doc, xref)
#        if pix.n < 5:       # this is GRAY or RGB
#            pix.writePNG("p%s-%s.png" % (i, xref))
#        else:               # CMYK: convert to RGB first
#            pix1 = fitz.Pixmap(fitz.csRGB, pix)
#            pix1.writePNG("p%s-%s.png" % (i, xref))
#            pix1 = None
#        pix = None

#python3
#import sys
#
#with open("ATLAS_VBFHinv_18.pdf","rb") as file:
#    file.seek(0)
#    pdf = file.read()
#
#startmark = b"\xff\xd8"
#startfix = 0
#endmark = b"\xff\xd9"
#endfix = 2
#i = 0
#
#njpg = 0
#while True:
#    istream = pdf.find(b"stream", i)
#    if istream < 0:
#        break
#    istart = pdf.find(startmark, istream, istream + 20)
#    if istart < 0:
#        i = istream + 20
#        continue
#    iend = pdf.find(b"endstream", istart)
#    if iend < 0:
#        raise Exception("Didn't find end of stream!")
#    iend = pdf.find(endmark, iend - 20)
#    if iend < 0:
#        raise Exception("Didn't find end of JPG!")
#
#    istart += startfix
#    iend += endfix
#    print("JPG %d from %d to %d" % (njpg, istart, iend))
#    jpg = pdf[istart:iend]
#    with open("jpg%d.jpg" % njpg, "wb") as jpgfile:
#        jpgfile.write(jpg)
#
#    njpg += 1
#    i = iend


