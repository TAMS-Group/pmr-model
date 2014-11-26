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

// main part of the payload slot

use <include/facePlate.scad>;
use <include/arduinoNano.scad>;
use <include/hc05.scad>;


out = 53;
in = 0.65*out;
diff = out-in;
strength = 3;

akkuLength = 50;
akkuWidth = 30;
akkuheight = 10.5;

clipPull = -0.65;	
clipRad = 4.125;
add = 2.5;

$fn=50;


rotate([0,-90,0]) batteryAddOn(out, in, strength);


module batteryAddOn(out, in, strength){
	frameWidth = (out-in)/2;
	mountingWidth = 1.3*frameWidth;
	stomWidth =0.25*mountingWidth;

	translate([-add/2,0,0]) difference(){
		union(){	
			difference(){
				translate([-akkuheight+1-strength/2-1, 0, 0]) rotate(a=-90, v=([1,0,0])) facePlate(out, in, 3+add);
				for(i=[0:1]){
					rotate([i*180,0,0]) translate([-akkuheight+strength/2-1-(strength+add)/2+(strength+add)/2,in/2-((out-in)/2),in/4]) cube([(strength+add)/2+1,in/3,in/3],center=true);
				}				
			}		
			translate([add/2,0,0]) union(){
				translate([-akkuheight/2,(out-frameWidth)/2,0]) cube([akkuheight,frameWidth,mountingWidth], center=true);						
				translate([-akkuheight/2,akkuWidth/2+2+((out-in)/4)-clipPull,stomWidth]) {
					rotate(a=90, v=[0,1,0]) cylinder(r=clipRad, h=akkuheight, center=true);				
				}
				translate([-akkuheight/2,+akkuWidth/2+2+((out-in)/4)-clipPull,-stomWidth]) {
					rotate(a=90, v=[0,1,0]) cylinder(r=clipRad, h=akkuheight, center=true);				
				}							
			}
			translate([add/2,0,0]) union(){
				translate([-akkuheight/2,-(out-frameWidth)/2,0]) cube([akkuheight,frameWidth,mountingWidth], center=true);					
				translate([-akkuheight/2,-akkuWidth/2-2-((out-in)/4)+clipPull,stomWidth]) {
					rotate(a=90, v=[0,1,0]) cylinder(r=clipRad, h=akkuheight, center=true);				
				}
				translate([-akkuheight/2,-akkuWidth/2-2-((out-in)/4)+clipPull,-stomWidth]) {
					rotate(a=90, v=[0,1,0]) cylinder(r=clipRad, h=akkuheight, center=true);				
				}									
			}
			translate([-akkuheight/2-2.75+add/2,-akkuWidth/2-1.5,0])  cube([akkuheight+5.5,3,in+1], center=true);		
			translate([-akkuheight/2-2.75+add/2,akkuWidth/2+1.5,0])  cube([akkuheight+5.5,3,in+1], center=true);												
		}
		rotate([90,0,0]) translate([-akkuheight+0.5-strength/2-1, 0, 0]) rotate(a=-90, v=([1,0,0])) busContacts_out(out, in, 5);		
		translate([-akkuheight-strength/2, 0, 0]) rotate(a=-90, v=([1,0,0])) holes_inAsy(out, in, 5.5, 3);
		translate([-akkuheight-strength/2, 0, 0]) rotate(a=-90, v=([0,0,0])) busContactsScrew_inAsy(out, in, 5.5, 3);
		for(i=[0:1]){
			rotate([i*180,0,0]) translate([-akkuheight+1-strength/2-1, 0, 0]) rotate(a=-90, v=([1,0,0])) screws(out, in, 5);		
		}
		translate([-akkuheight+1-(strength+2.5)/2, 0, 0]) rotate(a=-90, v=([1,0,0])) nutCatches(out, in, 5);		
	}
}