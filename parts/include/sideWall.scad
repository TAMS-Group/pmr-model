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