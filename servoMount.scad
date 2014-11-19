use <include/facePlate_clawar.scad>
use <include/sideWall.scad>
use <batteryAddOn.scad>

zugabe = 2+1;
//kantenlaenge = 47+zugabe;
wandstaerke = 2;
laenge = 27;
radiusRotationsgelenk = 12;
factor = 0.65;
accuracy_hole = 100;
front_holeOffset = kantenlaenge*0.125/2;
radiusLoch = 1;


servoMount(53);


module servoMount(kantenlaenge){	
	wandhoehe = kantenlaenge-4-6-2;
		difference(){
			union(){
				//faces
				translate([1, 0, 0]) facePlateMagnetBus_v3(kantenlaenge, factor*kantenlaenge, wandstaerke+1, 2); 
				// Wand mit Servo
				translate([0,3.5+2.4,0]){
					hull(){
						translate([0,kantenlaenge/2-(wandstaerke+1)/2-kantenlaenge/2.7,0]) sideWall(wandhoehe, laenge, wandstaerke, radiusRotationsgelenk);	
						translate([0,kantenlaenge/2-(wandstaerke+1)/2-kantenlaenge/2.7,0]) sideWall(wandhoehe-3, laenge-1, wandstaerke+2, radiusRotationsgelenk-1);	
					}
					translate([-0.5,kantenlaenge/2-(wandstaerke+1)/2-kantenlaenge/2.65-(wandstaerke+1.5),-(factor*kantenlaenge+5)/2]) cube([wandstaerke+1,2*(wandstaerke+3),factor*kantenlaenge+5]);	
				}
				// Wand außen
				hull(){
					translate([0,-kantenlaenge/2+(wandstaerke)/2,0]) sideWall(wandhoehe, laenge-6, wandstaerke, radiusRotationsgelenk-2);	
					translate([0,-kantenlaenge/2+(wandstaerke)-0.5/2+0.3,0]) sideWall(wandhoehe-4, laenge-6, wandstaerke, radiusRotationsgelenk-4);	
				}				
			}
		
		// Schrauben und Magnetlöcher
		mirror([1,0,0]) screws(kantenlaenge, factor*kantenlaenge, 5);	
		rotate([180,0,0]) screws(kantenlaenge, factor*kantenlaenge, 5);	
		mirror([1,0,0]) holes_out(kantenlaenge, factor*kantenlaenge, 15, 2);	
	}	
}
