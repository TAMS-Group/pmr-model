use <include/microServo_neg2.scad>;
use <servoMount.scad>;
use <batteryMount.scad>;
use <batteryAddOn.scad>;


$fn=50;
size = 52;
faceStrength = 3;
akkuheight = 10;

mirror([0,0,1]) translate([0,0,64]) rotate(a=-90,v=[0,1,0]) translate([0.5,0,0]) robotModule(size);
	

module robotModule(size){
	difference(){
		union(){
			servoMount(size);	
			translate([9+6,0,0]){
				mirror(0,1,0){
					batteryMount(size);	
				}
			}
			batteryAddOn(size, 0.65*size, faceStrength);
		}
		translate([20,-0.9,0]){
			rotate(a=-90, v=[1,0,0]) {		
				servo();
			}
		}	
	}
}
