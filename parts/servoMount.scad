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

// part of the joint where the servo-case is mounted

use <include/facePlate.scad>
use <batteryAddOn.scad>
use <include/sideWall.scad>

size = 53;
strength = 2;
length = 27;
radius = 12;
factor = 0.65;


servoMount(size);


module servoMount(size){	
	height = size-radius;
		difference(){
			union(){
				translate([1, 0, 0]) facePlate(size, factor*size, strength+1, 2); 
				translate([0,3.5+2.4,0]){
					hull(){
						translate([0,size/2-(strength+1)/2-size/2.7,0]) sideWall(height, length, strength, radius);	
						translate([0,size/2-(strength+1)/2-size/2.7,0]) sideWall(height-3, length-1, strength+2, radius-1);	
					}
					translate([-0.5,size/2-(strength+1)/2-size/2.65-(strength+1.5),-(factor*size+5)/2]) cube([strength+1,2*(strength+3),factor*size+5]);	
				}
				hull(){
					translate([0,-size/2+(strength)/2,0]) sideWall(height, length-6, strength, radius-2);	
					translate([0,-size/2+(strength)-0.5/2+0.3,0]) sideWall(height-4, length-6, strength, radius-4);	
				}				
			}
		// holes for screws and magnets
		mirror([1,0,0]) screws(size, factor*size, 5);	
		rotate([180,0,0]) screws(size, factor*size, 5);	
		mirror([1,0,0]) holes_out(size, factor*size, 15, 2);	
	}	
}
