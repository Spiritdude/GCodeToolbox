# -- Makefile for GCodeToolbox/tests/, written by Rene K. Mueller <spiritdude@gmail.com>
 
OPENSCAD = unset DISPLAY; openscad # .scad -> .stl
SLICER = ../gctoolbox --slicer=slic3r slice # or simply 'slic3r', .stl -> .gcode

all::	2cubes-concurrent.gcode 2cubes-complete.gcode \
      2cubes-concurrent-alt.gcode 2cubes-complete-alt.gcode \
      21cubes.gcode 21cubes2.gcode 9cubes3x3.gcode mixed.gcode mixed2.gcode
	cd array && make 

2cubes-concurrent.gcode:: cube10mm.gcode
	../gctoolbox cat 2x cube10mm.gcode > 2cubes-concurrent.gcode

2cubes-complete.gcode:: cube10mm.gcode
	../gctoolbox --sequence=complete cat 2x cube10mm.gcode > 2cubes-complete.gcode

# -- as comparison let slic3r create alike sequence
2cubes-concurrent-alt.gcode: 
	../gctoolbox --slicer=slic3r --slicer.duplicate=2 slice cube10mm.stl --slicer.o=2cubes-concurrent-alt.gcode

# -- as comparison let slic3r create alike sequence
2cubes-complete-alt.gcode:
	../gctoolbox --slicer=slic3r --slicer.duplicate=2 --slicer.complete-objects slice cube10mm.stl --slicer.o=2cubes-complete-alt.gcode


9cubes3x3.gcode::	cubeFancy10mm.gcode
	../gctoolbox --sequence=complete --cols=3 cat 9x cubeFancy10mm.gcode > 9cubes3x3.gcode

21cubes.gcode::	cube10mm.gcode
	../gctoolbox cat 21x cube10mm.gcode > 21cubes.gcode

21cubes2.gcode::	cube10mm.gcode
	../gctoolbox --printer=../printers/miniprusa.conf cat 21x cube10mm.gcode > 21cubes2.gcode

mixed.gcode:   cube10mm.gcode inchAxis.gcode
	../gctoolbox --sequence=complete cat 3x cube10mm.gcode 5x inchAxis.gcode 12x cube10mm.gcode 2x inchAxis.gcode > mixed.gcode

mixed2.gcode:   cube10mm.gcode cubeFancy10mm.gcode cubeFancyX10mm.gcode inchAxis.gcode steps5mm.gcode file01.list
	../gctoolbox --sequence=complete --fileList=file01.list cat > mixed2.gcode

# ---- automatic stuff below

%.stl:	%.scad
	$(OPENSCAD) $< -o $@

%.gcode: %.stl
	$(SLICER) $<
	
clean::
	rm -f *.gcode Thumbs.db
	cd array; make clean
