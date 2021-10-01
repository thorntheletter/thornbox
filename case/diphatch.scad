$fa = .1;
$fs = .1;
module diphatch(){
    difference(){
        union(){
            difference(){
                cube([80,40,10]);
                translate([9.5,9.5,-5]) cube([61,21,20]);
            }
            translate([10,20,0]) cylinder(h=10, r=5.5);
        }
        translate([10,20,6]) cylinder(h=10, r=5.5);
        translate([10,20,2]) cylinder(h=10, r=1.9);
        
        translate([69,17.5+5-.25,6]) cube([5.5,5.5,1.25]);
        translate([69,17.5-5-.25,6]) cube([5.5,5.5,1.25]);
    }
}
diphatch();