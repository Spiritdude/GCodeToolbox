all:: PLAPlate200x200.gcode

clean::
	rm -f *.gcode

PLAPlate200x200.gcode:
	./makePLATest
	../../gctoolbox cat --printerX=200 --printerY=200 --objectSpacing=3 cube-*-*.gcode > PLAPlate200x200.gcode


