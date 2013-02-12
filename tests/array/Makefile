all:: PLAPlate200x200.gcode ABSPlate200x200.gcode render

clean::
	rm -f pla-*.gcode abs-*.gcode Thumbs.db

render:
	../../gctoolbox render PLAPlate200x200.gcode ABSPlate200x200.gcode

PLAPlate200x200.gcode:
	./makePLATest
	../../gctoolbox cat --sequence=complete --cols=8 --printerX=200 --printerY=200 --objectSpacing=3 pla-cube-*.gcode > PLAPlate200x200.gcode

ABSPlate200x200.gcode:
	./makeABSTest
	../../gctoolbox cat --sequence=complete --cols=8 --printerX=200 --printerY=200 --objectSpacing=3 abs-cube-*.gcode > ABSPlate200x200.gcode

edit::
	dee4 make*

