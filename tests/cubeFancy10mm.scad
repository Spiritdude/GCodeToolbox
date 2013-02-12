// Cube Fancy 10mm, written by Rene K. Mueller <spiritdude@gmail.com>
//
// License: GPLv2
//
// History:
// 2013/02/12: first version
//
// Features:
// complex foot, gradual and heavy hangover

// units [mm]

difference() {
   cube(size=10);
   union() {
      cube(size=5);
      translate([10,0,0]) sphere(r=5,center=true,$fn=20);
      translate([10,10,0]) cylinder(h=10,r1=5,r2=0,$fn=20); 
   }
}

