//    This file is part of PMR-Model.
//
//    PMR-Model is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    PMR-Model is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with PMR-Model.  If not, see <http://www.gnu.org/licenses/>.

// This file can be used to generate the STL files.  

use <parts/include/microServo.scad>;
use <parts/servoMount.scad>;
use <parts/arduinoMount.scad>;
use <parts/batteryAddOn.scad>;


$fn=50;
size = 53;
faceStrength = 3;


//robotModule(size);

translate([0,-size*1.1,0]) servoModule(size);
arduinoModule(size);
translate([0,size*1.1,0]) payloadModule(size);

module robotModule(size){
	difference(){
		union(){
			servoMount(size);	
			translate([9+6,0,0]){
				mirror(0,1,0){
					arduinoMount(size);	
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

module servoModule(size){
	rotate(a=-90,v=[0,1,0]) translate([.5,0,0])
	difference(){
		servoMount(size);			
		translate([20,-0.9,0]){
			rotate(a=-90, v=[1,0,0]) {		
				servo();
			}
		}	
	}
}


module arduinoModule(size){
	rotate(a=-90,v=[0,1,0]) translate([50.5,0,0])
		difference(){
			arduinoMount(size);	
			translate([-5,0,0]){
				rotate(a=-90, v=[1,0,0]) {		
					mirror(0,1,0) #servo();
				}
			}		
		}		
}


module payloadModule(size){
	rotate(a=-90,v=[0,1,0]) translate([16,0,0])
		batteryAddOn(size, 0.65*size, faceStrength);
}