use <../../../lib/lib.scad>
use <NP700_Hole.scad>

rotate([90,180,90]) 
{
difference() {
    translate([0,-7.5,24]) rotate([180,0,0])walls(1) NP700_Hole();
    
    //connectors for minolta
    #translate([0,-4,2]) squa(6.5,5)cube([4.4,1,4], center=true);
    #translate([0,-4,0]) squa(6.5,2)cube([4.4,3,.4], center=true);

    //connector for charging
#    translate([0,-11,0]) cylinder(h=50, d=3.2);
    
    // bottom hole
    translate([0,-2,2])    cylinder(h=44.5,d=13);
//    cube([12.2,2.2,44]);

translate([-5,-11,-0])
linear_extrude(0.60) text("+ −",size=5);
}    

#translate([1.2,-15,47.2]) cube([6.3,8,.8]);
 translate([-.4,-8,0]) cube( [0.8,8,2]);
}

