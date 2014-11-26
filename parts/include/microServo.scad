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

// simplified model of the tower-pro mg90 micro-servo

width = 13.5;
length = 23;

$fn=50;

servo();
translate([5,0,19.5]) axisMount();

module servo(){
	union(){
		translate([-length/2-0.2, -width/2, -11.5]){
			//body
			union(){
				cube([length+0.4, width, length]);
				translate([length, 0, 19]){
					union(){
						difference(){
							cube([5, width, 2.5]);
							
							translate([3, 5.75, -1]) cube([4, 1.5, 4]);						
						}
						#translate([0.8, 0, 0]) hull(){
							translate([2.4, width/2, -5]){
								cylinder(h=15, r=1.25);
							}							
							translate([1.4, width/2, -5]){
								cylinder(h=15, r=1.25);
							}
						}						
					}
				}
				translate([-5, 0, 19]){
					union(){
						difference(){
							cube([5, width, 2.5]);

							translate([-2, 6, -1]) cube([4, 1.5, 4]);												
						}
						#hull(){
							translate([2, width/2, -5]){
								cylinder(h=15, r=1.25);
							}								
							translate([3, width/2, -5]){
								cylinder(h=15, r=1.25);
							}
						}
					}
				}					
			}

		}
		translate([length/2-width/2, 0, length/2]){
			union(){
				cylinder(h=gearHeight, r=width/2);
				translate([-length/4-1, 0, 0]){
					cylinder(h=gearHeight, r=3.5);
				}
				translate([0, 0, -40]){
					#cylinder(h=80, r=1.2);
				}
			}
		}
	}
	gearHeight = 5.5;
}


//	Mounting lever of micro servo tower-pro MG90
radBase1 = 2.3;
radBase2 = 3.5;
heightBase = 2.4;

radAxis = 3.9;
heightAxis = 6;

module axisMount(){
	difference(){
		union(){
			// base of the lever
			hull(){
				cylinder(r=radBase2, h=heightBase);				
				translate([23-radBase1-radBase2,0,0]){
					cylinder(r=radBase1, h=heightBase);
				}
			}
			// axis
			translate([0,0,-1]){
				cylinder(r=radAxis, h=heightAxis);
			}
		}
	}
}
