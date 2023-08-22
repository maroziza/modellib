module array(arr) {
    for(a = arr) translate(a) children();
}

module squa(x,y) {
array([[x/2,y/2,0],[x/2,-y/2,0],[-x/2,y/2,0],[-x/2,-y/2,0]])
    children();
}

module screw(H) {
    cylinder(h=H, d=3.3);
    translate([0,0,H-2]) cylinder(d=6.2, h=10+H);
}
