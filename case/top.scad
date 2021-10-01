$fa = .1;
$fs = .1;
layout = [[17,30.5],[47,30.5],[73,41.5],[91,95.5],
          [108,30.5],[135,19.5],[164,19.5],[193,19.5],
          [103,61.5],[129,50.5],[158,50.5],[187,50.5]];
screws = [[5,125],[205,125],[89,57],
          [205,55],[105,5],[5,5],
          [117,5],[117,42],[205,42],[205,5]];
          
          
eh = 16; //how much space below face
hh = 100; //arbitrarily large for holes
sh = 2; // how much space on opposite side for tht components
module mainButtons(layout) {
    for(i=layout){
        translate([i[0],130-i[1],-hh/2]) cylinder(hh, r=12+1);
    }
    translate([91,130-95.5,-hh/2]) cylinder(hh, r=15+1);
}

module optionButtons(){
    cube([74,8,hh]);
    for(i=[0:2]){
        translate([10*i+7,4,hh/2]) cylinder(hh,r=2.25);
    }
    for(i=[0:2]){
        // guess i misplaced second set of buttons by .5mm on pcb
        translate([10*i+46.5,4,hh/2]) cylinder(hh,r=2.25);
    }
}

module screwHoles(){
    for(i=screws){
        translate(i) cylinder(hh,r=2);
    }
}
        
module top(){
    difference(){
        minkowski(){
                cube([210,130,eh]);
                cylinder(5,r=5);
        }
        translate([-3,-3,-100+eh]) cube([216,136,100]);
        mainButtons(layout);
        translate([14.25-7,130-8.25-4,-hh+eh+3.5]) optionButtons();
    //    usbhole
        translate([(210-15)/2,130-11,eh-8-1.6+2]) cube([15,20,8]);
    //    tht back solder room
            difference(){
                union(){
                    translate([110,0,-hh+eh+sh]) cube([210-110,130-62.5,hh]);
                    translate([95,0,-hh+eh+sh]) cube([210-95,130-107.5,hh]);
                   translate([60,130-94.5,-hh+eh+sh]) cube([12.5,12.5,hh]);
                }
                for(i=screws){
                    translate([i[0],i[1],eh]) cylinder(5,r=4);
            }
        }
    
        translate([0,0,-hh+eh+4])screwHoles();
        
        // forgot to measure led height, would stick through
        // uncomment if youre fine with that or making it thicker
//        for(i=[0:3]){
//            translate([140+11.5*i,130-3.25,-hh+eh+9]) cylinder(hh, r=3);
//        }
        
    }
}
top();
