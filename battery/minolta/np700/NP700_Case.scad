use <../../../lib/lib.scad>
$fn=360;

module grob() {
translate([-7.5,-15,0])

difference() {
cube([15.5, 15, 48]);
difference() {
cube([15.5, 7, 48]);
translate([7.75,8,0]) cylinder(d=15.6,h=48);

}
}
}rotate([90,180,90]) {
difference() {
    grob();
    
    difference() {
    translate([0,-0.8,0.4]) #scale([0.95, 0.9, 0.95]) grob();
    // connector plate
        translate([0,-7,.8])cube([20,20,0.8],center=true);
    }
    //connectors for minolta
    translate([0,-4,2]) squa(6.5,5)cube([4.4,.6,4], center=true);
    translate([0,-4,0]) squa(6.5,2)cube([4.4,3,.4], center=true);

    //connector for charging
    translate([0,-11,0]) cylinder(h=50, d=3.2);
    // bottom hole
    translate([-6,-2,2])cube([12.2,2.2,44]);
translate([-5,-11,-0])
linear_extrude(0.40) text("+ −",size=5);
    
}
#translate([1.5,-14.8,47.2]) cube([6,15,.8]);
 translate([-.4,-8,0]) cube( [0.8,8,2]);
}