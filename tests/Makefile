
all::	21cubes.gcode 21cubes2.gcode 9cubes3x3.gcode mixed.gcode mixed2.gcode
	cd array; make 

9cubes3x3.gcode::	cube10mm.gcode
	../gctoolbox --cols=3 cat 9x cube10mm.gcode > 9cubes3x3.gcode

21cubes.gcode::	cube10mm.gcode
	../gctoolbox cat 21x cube10mm.gcode > 21cubes.gcode

21cubes2.gcode::	cube10mm.gcode
	../gctoolbox --printer=../printers/miniprusa.conf cat 21x cube10mm.gcode > 21cubes2.gcode

mixed.gcode:   cube10mm.gcode inchaxis.gcode
	../gctoolbox cat 3x cube10mm.gcode 5x inchaxis.gcode 12x cube10mm.gcode 2x inchaxis.gcode > mixed.gcode

mixed2.gcode:   cube10mm.gcode inchaxis.gcode steps5mm.gcode
	../gctoolbox --fileList=f01.list cat > mixed2.gcode

# ----

cube10mm.gcode:   cube10mm.stl
	../gctoolbox slice cube10mm.stl

steps5mm.gcode:   steps5mm.stl
	../gctoolbox slice steps5mm.stl

inchaxis.gcode:	inchaxis.stl
	../gctoolbox slice inchaxis.stl

sshot-6-300px.png:	sshot-6.png
	convert -resize 300x sshot-6.png sshot-6-300px.png

clean::
	rm -f *.gcode Thumbs.db
	cd array; make clean
