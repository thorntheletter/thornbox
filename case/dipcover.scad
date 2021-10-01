$fa = .1;
$fs = .1;
difference(){
    union(){
        translate([0,-.25,0]) cube([60,20.5,4]);
        translate([59,17.5-15,0]) cube([5,5,1]);
        translate([59,17.5-5,0]) cube([5,5,1]);
        translate([0,10,0]) cylinder(h=4, r=5);
    }
    translate([0,10,-1]) cylinder(h=6, r=3.5/2);
    translate([0,10,2]) cylinder(h=6, r=3);
}