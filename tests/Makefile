
all::	cube10mm.gcode 21cubes.gcode 21cubes2.gcode inchaxis.gcode mixed.gcode 
	cd array; make 

cube10mm.gcode:   cube10mm.stl
	../gctoolbox slice cube10mm.stl

inchaxis.gcode:	inchaxis.stl
	../gctoolbox slice inchaxis.stl

21cubes.gcode::	cube10mm.gcode
	../gctoolbox cat 21x cube10mm.gcode > 21cubes.gcode

21cubes2.gcode::	cube10mm.gcode
	../gctoolbox --printer=miniprusa.conf cat 21x cube10mm.gcode > 21cubes2.gcode

mixed.gcode:   cube10mm.gcode inchaxis.gcode
	../gctoolbox cat 3x cube10mm.gcode 5x inchaxis.gcode 12x cube10mm.gcode 2x inchaxis.gcode > mixed.gcode

clean::
	rm -f *.gcode
	cd array; make clean
