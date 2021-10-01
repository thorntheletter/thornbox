use <top.scad>;
use <bottom.scad>
use <smallbutton.scad>
use <bigbutton.scad>

layout = [[17,30.5],[47,30.5],[73,41.5],
          [108,30.5],[135,19.5],[164,19.5],[193,19.5],
          [103,61.5],[129,50.5],[158,50.5],[187,50.5]];
          
brim = 10.6;
tspace = 16;
color("#6f6f6f") translate([0,0,brim]) top();
color("#212121") bottom();
color("green") translate([-48,27+130,brim+tspace-1.6]) import("thornboard1.0.stl");
color("#00dede") 
for(i=layout){
    translate([i[0],130-i[1],brim+tspace+10]) rotate([180,0,90]) smallbutton();
}
color("#00dede") translate([91,130-95.5,brim+tspace+10]) rotate([180,0,90]) bigbutton();