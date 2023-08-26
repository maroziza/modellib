use <../../../lib/lib.scad>

module NP700_Hole() {
    difference() {
        cube([15, 15, 48], center= true);
        difference() {
            translate([0,4,0])  cube([16, 8, 49], center=true);
            cylinder(d=15,h=48, center=true);
        }
    }
}