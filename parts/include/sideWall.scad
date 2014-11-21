// sidewalls of the two parts building the joint
use <microServo.scad>;


$fn=50;

sideWall_withServoAxisFix(49, 26, 3, 12);
//sideWall(49, 26, 3, 12);


// simple wall
module sideWall(height, length, strength, radius){
	hull(){
		difference(){					
			translate([0,-strength/2,-height/2]) cube([length,strength,height]);
			translate([0,-strength,-height/2]) rotate(a=45,v=[0,1,0]) cube([100,strength*2,100]);					
			translate([0,-strength,height/2]) rotate(a=45,v=[0,1,0]) cube([100,strength*2,100]);				
		}
		translate([length,strength/2,0.5*height-height/2]){
			rotate(a=90,v=[1,0,0]){
				cylinder(h=strength, r=radius);
			}
		}
	}
}

// wall where the servo axis mount can be mounted
module sideWall_withServoAxisFix(height, length, strength, radius){
	difference(){
		hull(){
			sideWall(height, length, strength, radius);
			translate([0,-1,0]) sideWall(height-2, length-2, strength, radius-2);
			translate([length,0,0]) difference(){
				hull(){
					translate([-17,0,0]) rotate(a=90, v=[1,0,0]) cylinder(h=strength, r=5);
					rotate(a=90, v=[1,0,0]) cylinder(h=strength, r=7);								
				}
			}
		}
		translate([length+0.2,-1.1,0]) rotate(a=180, v=[0,1,0]){
			rotate(a=90, v=[1,0,0]){
				axisMount();
			}
		}
	}
}