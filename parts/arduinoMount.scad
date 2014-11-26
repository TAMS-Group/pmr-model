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

// Part of one joint that holds the arduino board

use <include/arduinoNano.scad>;
use <include/facePlate.scad>;
use <include/sideWall.scad>;


size = 53;
strength = 2;
length = 32;
radius = 9;
factor = 0.65;


arduinoMount(53);

	 
module arduinoMount(size){	
	difference(){
		translate([-length*1.5, -size/2, 0]){	
			difference(){	
				union(){
					//frontplate					
					translate([0, size/2, 0]) mirror([0,0,1]) facePlate(size, factor*size, 5);				
					// wall with usb slot
					hull(){
						translate([0,(strength)/2+4.3,0]) sideWall(size-13, length+2, strength, radius);	
						translate([0,(strength)/2+5.8,0]) sideWall(size-17, length+1, strength, radius-1);	
					}
					// wall with servo
					translate([0,size-(strength)/2-0.25,0]) 
						rotate(a=0,v=[1,0,0]) 
							sideWall_withServoAxisFix(size-4-7-2, length+6, strength+0.5, radius);			
				}
				// holes for screws and magnets
				translate([0, size/2, 0]) mirror([0,0,1]) busContacts(size, factor*size, 5);
				translate([2.5, size/2, 0]) mirror([0,0,1]) busContacts(size, factor*size, 5);						
				translate([-3, size/2, 0]) mirror([1,0,0]) screws(size, factor*size, 7.5);			
				translate([-3, size/2, 0]) rotate([-90,0,0])  mirror([1,0,0]) screws(size, factor*size, 7.5);			
			}
		}			
		rotate(a=270, v=[0,1,0]) {		
			translate([0,-1.5+2.5+1,length+6]) rotate(a=90, v=[0,0,1]) rotate(a=-5, v=[0,1,0]) arduinoNano();
		}								
	}
}

