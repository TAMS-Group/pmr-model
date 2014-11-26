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

// connection faces of the three different robot parts

include <neodymMagnet.scad>;
use <../../nutsnbolts/cyl_head_bolt.scad>;
use <busContact.scad>

factor = 0.65;
thickness = 5;
stabilisator = 3;

$fn=50;


difference(){
	facePlate(53, factor*53, thickness);
	//facePlate(53, factor*53, thickness, stabilisator);
	holes_out(53, factor*53, 11, 2);
	busContacts(53, factor*53, thickness);
	//nutCatches(53, factor*53, thickness);
	//screws(53, factor*53, thickness);
	//busContactsScrew_inAsy(53, factor*53, thickness);
}




module faceFrame(sizeOut, sizeIn, thickness){
	difference(){
		translate([-thickness/2, -sizeOut/2, -sizeOut/2]) cube([thickness,sizeOut,sizeOut]);
		translate([-0.5*thickness*2, -sizeIn/2+0.1, -sizeIn/2+0.1]){
			cube([thickness*2,sizeIn-0.2,sizeIn-0.2]);
		}														
	}
}

module facePlate(sizeOut, sizeIn, thickness, stabilisator=0){	
	//frontplate
	union(){
		faceFrame(sizeOut, sizeIn, thickness);
		for(i=[0:3]) {
			rotate([i*90, 0, 0]) {
				translate([-thickness/2,sizeIn/2-((sizeOut-sizeIn)/2),sizeIn/2-((sizeOut-sizeIn)/2)]){				
					cube([thickness,(sizeOut-sizeIn)/2,(sizeOut-sizeIn)/2]);					
				}
			}
		}
		if(stabilisator > 0){
			for(i=[0:1]) {
				hull(){ 
					rotate([i*180, 0, 0]) translate([thickness/2+stabilisator/20, 0, sizeIn/2+(sizeOut-sizeIn)/4]) cube([stabilisator/10, sizeOut, (sizeOut-sizeIn)/2], center=true);
					rotate([i*180, 0, 0]) translate([thickness/2+stabilisator/2, 0, sizeIn/2+(sizeOut-sizeIn)/4]) cube([stabilisator, sizeOut-2, (sizeOut-sizeIn)/2-2], center=true);
				}
			}
		}
	}					
}	


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------- Modules for substraction to create slots for different srews and magnets ----------------------------------------------------------
module busContacts(sizeOut, sizeIn, thickness){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	//tolerance = 1.1;
	union(){				
		for ( i = [0 : 3] ){
			rotate([i*90, 0, 0]) translate([x, sizeIn/2+width/2-offset, sizeIn/2+width/2-offset]) rotate([0,90,0]) busContact(magnetRad, magnetHeight, "M4", 3, 2, 5);
			rotate([i*90, 0, 0]) translate([x, sizeIn/2-width/2+offset, sizeIn/2-width/2+offset]) rotate([0,90,0]) busContact(magnetRad, magnetHeight, "M4", 3, 2, 5);
		}
	}
}

module busContactsScrew_inAsy(sizeOut, sizeIn, thickness){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.1;
	union(){				
		for ( i = [0 :2: 3] ){		
			rotate([i*90, 0, 0]) translate([-x, sizeIn/2-width/2+offset, sizeIn/2-width/2+offset]) rotate([0,90,0]) scale(tolerance) nutcatch_parallel("M3", l=6);
		}				
	}
}

module busContacts_out(sizeOut, sizeIn, thickness){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.1;

	union(){				
		for ( i = [0 : 3] ){
			rotate([i*90, 0, 0]) translate([x, sizeIn/2+width/2-offset, sizeIn/2+width/2-offset]) rotate([0,90,0]) busContact(magnetRad, magnetHeight, "M4", 3, 2, 5);			
		}		
	}
}

module holes_out(sizeOut, sizeIn, thickness, rad){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.1;
	tol = 0.2;
	union(){				
		for ( i = [0 : 3] ){
			rotate([i*90, 0, 0]) translate([x, sizeIn/2+width/2-offset, sizeIn/2+width/2-offset]) rotate([0,90,0]) cylinder(r=rad+tol, h=thickness+0.2);			
		}			
	}
}

module holes_inAsy(sizeOut, sizeIn, thickness, rad){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.1;
	tol = 0.2;
	union(){				
		for ( i = [0 :2: 3] ){			
			rotate([i*90, 0, 0]) translate([x, sizeIn/2-width/2+offset, sizeIn/2-width/2+offset]) rotate([0,90,0]) cylinder(r=rad+tol, h=thickness+0.2);
		}			
	}
}

module nutCatches(sizeOut, sizeIn, thickness){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.1;
	union(){								
		translate([-0.01, 0, -sizeOut/2+(sizeOut-sizeIn)/4]) rotate(a=90, v=[0,1,0]) rotate(a=90, v=[0,0,1]) scale([tolerance, tolerance, 1]) nutcatch_parallel("M4", l=2.5);
		translate([-0.01, 0, sizeOut/2-(sizeOut-sizeIn)/4]) rotate(a=90, v=[0,1,0]) rotate(a=90, v=[0,0,1]) scale([tolerance, tolerance, 1]) nutcatch_parallel("M4", l=2.5);
	}
}

module screws(sizeOut, sizeIn, thickness){
	width = sizeOut/2-sizeIn/2;
	x = -thickness/2-0.1;
	offset = width/10;
	tolerance = 1.15;
	union(){						
		translate([thickness/2-magnetHeight/2+2+15, 0, sizeOut/2-(sizeOut-sizeIn)/4])  rotate(a=90, v=[0,1,0]) scale([tolerance, tolerance, 1]) screw("M4x25");		
	}
}