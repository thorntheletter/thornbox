$fa = .1;
$fs = .1;
use <diphatch.scad>
layout = [[17,30.5],[47,30.5],[73,41.5],[91,95.5],
          [108,30.5],[135,19.5],[164,19.5],[193,19.5],
          [103,61.5],[129,50.5],[158,50.5],[187,50.5]];
upbutton = [91,95.5];
screws = [[89,57],[205,55],[117,5],[117,42],[205,42],[105,5]];
cornerscrews = [[5,125],[205,125],[5,5],[205,5]];
br = 10.6; //bottom rim
bh = 3; //how much space on bottom
eh = 20; //how much space to pcb(s)
hh = 100; //arbitrarily large for holes
sh = 2; //tht back side solder

module bottom(){
    union(){
   difference(){
        union(){
            difference(){        
                union(){
                    difference(){
                        minkowski(){
                                cube([210,130,br-1]);
                                cylinder(1,r=5);
                            
                        }
                        cube([210,130,eh+bh]);

                    }
                    cube([210,130,eh+bh]);
                }
                for(i = layout){
                    translate([i[0],130-i[1],bh+eh-4]) cylinder(hh, r=12);
                }
                translate([upbutton[0],130-upbutton[1],bh+eh-4]) cylinder(hh, r=15);
//                translate([14.25-7,130-8.25-4,bh+eh-sh]) cube([74,8,hh]);
                translate([14.25-7,130-8.25-4,bh+eh-sh]) cube([74,8,hh]);
//                translate([97.5,130-11,bh+eh-8]) cube([15,20,hh]);
                translate([97.5,130-11,bh+eh-8]) cube([15,20,hh]);
                translate([100,0,bh]) cube([110,130-52.5,hh]);
                translate([85,0,bh]) cube([210-85,130-97.,hh]);
                translate([15-.5,31.5-.5,-hh/2]) cube([60,21,hh]);
        translate([5,31.5-10,-hh+10]) cube([80,40,hh]);
            }

            translate([205.5,4.5,(bh+eh)/2]) cube([9,9,bh+eh], center=true);
        }
        for(i=cornerscrews){
            translate([i[0],i[1],-hh/2]) cylinder(hh, r=3.5/2);
            translate([i[0],i[1],-1]) cylinder(5.5, r=3);
        }
        for(i=screws){
            translate([i[0],i[1],eh+bh-3]) cylinder(3.5, r=3);
        }
    }
        translate([(15-10),40+(31.5-10),10]) rotate([180,0,0]) diphatch();
        
    }
}
bottom();