use <parts/include/microServo_neg2.scad>;
use <parts/servoMount.scad>;
use <parts/batteryMount.scad>;
use <parts/batteryAddOn.scad>;


$fn=50;
size = 53;
faceStrength = 3;

//mirror([0,0,1]) translate([0,0,-66])
//translate([0,0,16]) 
rotate(a=-90,v=[0,1,0]) robotModule(size);
	

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