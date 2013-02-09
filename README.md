<h1>GCodeToolbox<h1>

<b>Version: 0.002 (ALPHA)</b>

GCodeToolbox (gctoolbox executable) is a command-line (perl) program to manipulate .gcode files (for 3D printers & RepRaps) as created by slicers (like Slic3r) from .stl files. 

The main aim of this package is to be able to 
<ol>
<li>create various pieces (.gcode) with different settings (infill, infill-methods, extrude temperature etc) and 
<li><b>then</b> concate them for <b>one print</b> (untested).
</ol>

<h2>Examples</h2>

<h3>Information of GCODE</h3>

<pre>
% gctoolbox cube10mm.gcode
% gctoolbox info cube10mm.gcode
</pre>

prints out some information about the actual gcode

<h3>Slicing STL to GCODE</h3>

<pre>
% gctoolbox slice cube10mm.stl
% gctoolbox --slicer=slic3r --slicer.skirt_distance=2 slice cube10mm.stl
</pre>
creates cube10mm.gcode, default slicer is Slic3r, and arguments for the slicer can be given by --slicer.[arg]=[value].
<pre>
% gctoolbox --slicer=skeinforge slice cube10mm.stl
</pre>
use another slicer backend, it has to create .gcode

<h3>Concate</h3>

<pre>
% gctoolbox cat cube10mm.gcode inchaxis.gcode > mixed.gcode
</pre>
concat several gcode files into one gcode.

You can also define a multiplication:

<pre>
% gctoolbox cat 10x cube10mm.gcode 3x inchaxis.gcode > mixed2.gcode
</pre>
which concates 10 times cube10mm's and 3 times inchaxis's.

<h3>Printer Definition</h3>

You can define a profile of your printer (default X=200, Y=200, Z=200 and margin=3), with e.g. "myprinter.conf":
<pre>
X: 150
Y: 180
Z: 120
margin: 3
</pre>
   
defines the build-volume, margin of the built-platform toward the pieces, all variables of .conf file are also available via command-line --printer[key]=[value] as well ([key] starts with uppercase letter), for example:

<pre>
% gctoolbox --printer=myprinter.conf cat 10x cube10mm.gcode > 10cubes.gcode
% gctoolbox --printerX=200 --printerY=180 --printerMargin=5 --objectSpacing=5 3x cube10mm.gcode > 3cubes.gcode
</pre>

<h3>Tests</h3>

<pre>
% make tests
</pre>

and it will do some tests in tests/ and tests/array/; best explore the files.

<h3>Visualization</h3>

Best visit http://www.buildlog.net/gview/ and simply drag&drop your .gcode file to the browser-window, and it will preview the gcode.


That's all for now,

Rene K. Mueller<br>
2013/02/08
