all:: PLAPlate200x200.gcode ABSPlate200x200.gcode

clean::
	rm -f *.gcode Thumbs.db

PLAPlate200x200.gcode:
	./makePLATest
	../../gctoolbox cat --sequence=complete --cols=8 --printerX=200 --printerY=200 --objectSpacing=3 pla-cube-*.gcode > PLAPlate200x200.gcode

ABSPlate200x200.gcode:
	./makeABSTest
	../../gctoolbox cat --sequence=complete --cols=8 --printerX=200 --printerY=200 --objectSpacing=3 abs-cube-*.gcode > ABSPlate200x200.gcode

edit::
	dee4 make*

