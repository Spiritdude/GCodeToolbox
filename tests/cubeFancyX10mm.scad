// Cube FancyX 10mm, written by Rene K. Mueller <spiritdude@gmail.com>
//
// License: GPLv2
//
// History:
// 2013/02/12: first version
//
// Features:
// complex foot, complex top

// units [mm]

difference() {
   cube(size=10);
   union() {
      cube(size=5);
      translate([10,0,0]) sphere(r=5,center=true,$fn=20);
      translate([10,10,0]) cylinder(h=10,r1=5,r2=0,$fn=20); 
  
      translate([0,5,5.01]) cube(size=5); // must be 5.01, as 5.0 gives compiling error on the command-line of openscad
      translate([10,0,10]) sphere(r=5,center=true,$fn=20);
   }
}

