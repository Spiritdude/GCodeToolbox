all:: oneprint.gcode

clean::
	rm -f *.gcode

oneprint.gcode:
	./makeTest
	../../gctoolbox cat --objectSpacing=3 cube-*-*.gcode > oneprint.gcode

