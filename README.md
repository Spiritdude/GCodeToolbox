<h1>GCodeToolbox<h1>

<b>Version: 0.006 (ALPHA)</b>

GCodeToolbox (<tt>gctoolbox</tt>) is a command-line perl-script to manipulate .gcode files (for 3D printers & RepRaps) as created by slicers (like Slic3r or Skeinforge) from .stl files. 

The main aim of this package is to be able to 
<ol>
<li>create various pieces (.gcode) with different settings (infill, infill-methods, extrude temperature etc) and 
<li><b>then</b> concate them for <b>one print</b> (yet untested).
</ol>

<h2>History</h2>
<ul>
<li> 2013/02/09: 0.006: fanSpeed and temperature arguments possible, override gcode, proper filtering of object settings
<li> 2013/02/09: 0.005: proper header and trailer if objects are concated
<li> 2013/02/09: 0.004: proper movement at wrapping at concating (inserting G1 moves)
<li> 2013/02/09: 0.003: optional left-to-right to right-to-left swinging
<li> 2013/02/09: 0.002: passing slicer arguments via --slicer.[key]=[value]
<li> 2013/02/08: 0.001: start, info and concat works
</ul>

<h2>Installation</h2>
<pre>
% make install
</pre>

which copies the <tt>gctoolbox</tt> to /usr/local/bin/ - that's all.

<h2>Examples</h2>

<h3>Information of GCODE</h3>

<pre>
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

<img src="tests/sshot-6.png" style="width: 300px; float: right; margin-left: 2em">
<pre>
% gctoolbox cat cube10mm.gcode inchaxis.gcode > mixed.gcode
</pre>
concat several gcode files into one gcode.

You can also define a multiplication:

<pre>
% gctoolbox cat 10x cube10mm.gcode 3x inchaxis.gcode > mixed2.gcode
</pre>
which concates 10 times cube10mm's and 3 times inchaxis's.

By default pieces are arranged left-to-right and when it overflows they are a placed further on the platform, but you can force wrapping:
<pre>
% gctoolbox --cols=5 cat 25x cube10mm.gcode > 25cubes5x5.gcode
</pre>

which is ideal when a grid of test objects with different settings are made (e.g. per row one temperature, per column certain settings like infill density).

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
