use <axisMount.scad>;

$fn=50;

sideWall_withServoAxisFix(49, 26, 3, 12);

module sideWall(kantenlaenge, modullaenge, wandstaerke, roationsRadius){
	hull(){
		difference(){					
			translate([0,-wandstaerke/2,-kantenlaenge/2]) cube([modullaenge,wandstaerke,kantenlaenge]);

			translate([0,-wandstaerke,-kantenlaenge/2]) rotate(a=45,v=[0,1,0]) cube([100,wandstaerke*2,100]);					
			translate([0,-wandstaerke,kantenlaenge-kantenlaenge/2]) rotate(a=45,v=[0,1,0]) cube([100,wandstaerke*2,100]);				
		}
		translate([modullaenge,wandstaerke/2,0.5*kantenlaenge-kantenlaenge/2]){
			rotate(a=90,v=[1,0,0]){
				cylinder(h=wandstaerke, r=roationsRadius);
			}
		}
	}
}


// Wand mit Servo
module sideWall_withServoAxisFix(kantenlaenge, modullaenge, wandstaerke, roationsRadius){
	difference(){
		hull(){
			sideWall(kantenlaenge, modullaenge, wandstaerke, roationsRadius);
			translate([0,-1,0]) sideWall(kantenlaenge-2, modullaenge-2, wandstaerke, roationsRadius-2);
			translate([modullaenge,0,0]) difference(){
				hull(){
					translate([-17,0,0]) rotate(a=90, v=[1,0,0]) cylinder(h=wandstaerke, r=5);
					rotate(a=90, v=[1,0,0]) cylinder(h=wandstaerke, r=7);								
				}
			}
		}
		translate([modullaenge+0.2,-1.1,0]) rotate(a=180, v=[0,1,0]){
			rotate(a=90, v=[1,0,0]){
				axisMount();
			}
		}
	}
}