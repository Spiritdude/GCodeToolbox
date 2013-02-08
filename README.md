<h1>GCodeToolBox<h1>

GCodeToolBox (gctoolbox exectuable) is a command-line (perl) program to manipulate .gcode files
as created by slicers from .stl files.

<h2>Examples</h2>

<h3>Information of GCODE</h3>

% gctoolbox cube10mm.gcode
% gctoolbox info cube10mm.gcode

prints out some information about the actual gcode

<h3>Slicing STL to GCODE</h3>

% gctoolbox slice cube10mm.stl

creates cube10mm.gcode, default slicer is Slic3r

% gctoolbox --slicer=anotherSlicer slice cube10mm.stl

use another slicer backend, it has to create .gcode

<h3>Concate</h3>

% gctoolbox cat cube10mm.gcode inchaxis.gcode > mixed.gcode

concat several gcode files into one gcode.

You can also define a multiplication:

% gctoolbox cat 10x cube10mm.gcode 3x inchaxis.gcode > mixed2.gcode

which concates 10x cube10mm's and 3x inchaxis's

<h3>Printer Definition</h3>

You can define a profile of your printer (default X=200, Y=200, Z=200 and margin=3), with e.g. "myprinter.conf":
   X: 150
   Y: 180
   Z: 120
   margin: 3
   
defines the build-volume, margin of the built-platform toward the pieces, all variables of .conf file 
are also available via command-line --printer<key>=<value> as well, for example:

% gctoolbox --printer=myprinter.conf cat 10x cube10mm.gcode > 10cubes.gcode

% gctoolbox --printerX=200 --printerY=180 --printerMargin=5 --objectSpacing=5 3x cube10mm.gcode > 3cubes.gcode

<h3>Visualization</h3>

Best visit http://www.buildlog.net/gview/ and simply drag&drop your .gcode file to the browser-window,
and it will preview the gcode.


That's all for now,

Rene K. Mueller
2013/02/08
