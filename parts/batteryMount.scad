use <include/arduinoNano.scad>;
use <include/facePlate.scad>;
use <include/sideWall.scad>;

zugabe = 2+1;
radiusLoch = 1;
kantenlaenge = 53;
wandstaerke = 2;
laenge = 32;
radiusRotationsgelenk = 9;
factor = 0.65;
accuracy_hole = 100;
front_holeOffset = kantenlaenge*0.125/2;

batteryMount(53);

	 
module batteryMount(kantenlaenge){	
	//arduino nano halterung		
	difference(){
		translate([-laenge*1.5, -kantenlaenge/2, 0]){	
			difference(){	
				union(){
					//frontplate					
					translate([0, kantenlaenge/2, 0]) mirror([0,0,1]) facePlateMagnetBus_v3(kantenlaenge, factor*kantenlaenge, 5);				
					// Wand außen (usb)
					hull(){
						translate([0,(wandstaerke)/2+4.3,0]) sideWall(kantenlaenge-13, laenge+2, wandstaerke, radiusRotationsgelenk);	
						translate([0,(wandstaerke)/2+5.8,0]) sideWall(kantenlaenge-17, laenge+1, wandstaerke, radiusRotationsgelenk-1);	
					}
					// Wand mit Servo
					translate([0,kantenlaenge-(wandstaerke)/2-0.25,0]) 
						rotate(a=0,v=[1,0,0]) 
							sideWall_withServoAxisFix(kantenlaenge-4-7-2, laenge+6, wandstaerke+0.5, radiusRotationsgelenk);			
				}
				// Schrauben und Magnetlöcher
				translate([0, kantenlaenge/2, 0]) mirror([0,0,1]) busContacts(kantenlaenge, factor*kantenlaenge, 5);						
				translate([-3, kantenlaenge/2, 0]) mirror([1,0,0]) screws(kantenlaenge, factor*kantenlaenge, 7.5);			
				translate([-3, kantenlaenge/2, 0]) rotate([-90,0,0])  mirror([1,0,0]) screws(kantenlaenge, factor*kantenlaenge, 7.5);			
			}
		}			
		rotate(a=270, v=[0,1,0]) {		
			translate([0,-1.5+2.5+1,laenge+6]) rotate(a=90, v=[0,0,1]) rotate(a=-5, v=[0,1,0]) arduinoNano();
		}								
	}
}

