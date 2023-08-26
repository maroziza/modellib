use <../../../lib/lib.scad>
use <../../../lib/flexbatter2.1.scad>
use <NP700_Hole.scad>
%translate([24,0,9]) rotate([90,0,90])  NP700_Hole();

ew=0.56;
difference() {
flexbatter(2,1,
49,16.0,

0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0);
translate([50,-3,5])
rotate([90,90,90])
    array([
    [0,0],
    [0,6],
    [0,19.5],
    [0,25.5]
    
    ])
    
    #cylinder(d=3, h=10, center=true);
}
