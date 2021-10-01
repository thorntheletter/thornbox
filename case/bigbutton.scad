$fa = .1;
$fs = .1;
module bigbutton(){
    union(){
        difference(){
            translate ([0,0,4]) minkowski(){
                        cylinder(2.5,r=15-4);
                        difference(){
                            sphere(r=4);
                            translate([0,0,50]) cube(100, center=true);
                       
                }
            }
            translate([0,0,1.5]) cylinder(9, r=15-1.5);
        }
        translate([0,2.85,1+2-.5]) cube([2.5,.9,5], center = true);
        translate([0,-2.85,1+2-.5]) cube([2.5,.9,5], center=true);
    }
}
bigbutton();