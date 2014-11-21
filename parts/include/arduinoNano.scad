// Standard arduino nano v3 board

boardLength = 45;
boardWidth = 19;
boardHeight = 2.75;

pins = 8.5;

arduinoNano();
//arduinoNano_withoutPins();


module arduinoNano_withoutPins(){
	translate([-boardLength/2,-boardWidth/2,0]){
		union(){
			cube([boardLength, boardWidth, boardHeight]);				
			translate([-1.5,boardWidth/2-3.75,boardHeight-0.1-0.6]){
				cube([9, 8, 5.2]);
			}
			translate([2-0.1,boardWidth/2,-boardHeight/2+0.1+0.25]){
				cube([4, boardWidth, 3-0.5], center=true);
			}
		}
	}
}

module arduinoNano(){
	union(){
		arduinoNano_withoutPins();
		translate([-boardLength/2,-boardWidth/2,0]){
			union(){
				cube([boardLength, boardWidth, boardHeight]);
				translate([2+2,0,-pins]){
					cube([boardLength-8, 2, pins]);
				}
				translate([2+2,boardWidth-2,-pins]){
					cube([boardLength-8, 2, pins]);
				}			
			}
		}
	}
}